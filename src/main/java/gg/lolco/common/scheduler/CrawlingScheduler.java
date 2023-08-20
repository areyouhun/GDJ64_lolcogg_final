package gg.lolco.common.scheduler;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvException;

import gg.lolco.model.service.ChampPredictService;
import gg.lolco.model.service.CommunityService;
import gg.lolco.model.service.SchedulerService;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class CrawlingScheduler {
	
	private final SchedulerService service;
	private final CommunityService commuService;
	private final ChampPredictService predictService;
	private final ServletContext context;
	
	private final Map<String, String> PARSE_TEAM_NAME = Map.of(
			"Gen.G eSports", "GEN", "Dplus KIA", "DK", 
			"Nongshim RedForce", "NS", "BRION", "BRO",
			"DRX", "DRX", "Hanwha Life eSports", "HLE",
			"KT Rolster", "KT", "T1", "T1",
			"Liiv SANDBOX", "LSB", "Kwangdong Freecs", "KDF");
	
	public CrawlingScheduler(SchedulerService service, ServletContext context
			,CommunityService commuService, ChampPredictService predictService) {
		this.service = service;
		this.context = context;
		this.commuService = commuService;
		this.predictService = predictService;
	}
	
	@Scheduled(cron = "0 0 1 * * ?")
	public void catchExceptionMethod() {
        LocalDate currentDate = LocalDate.now();
        
        LocalDate stopSchedulerDate = LocalDate.of(2023, 8, 27);
        
        commuService.deleteDate();
        
        try {
	    	if(!currentDate.isAfter(stopSchedulerDate)) {
	    		getPlayerData();
	    		getMatchSchedule();
	    		getMatchData();
	    		getTeamRanking();
	    		getRegionalMatch();
	    		champPredictCompare();
	    		log.debug("크롤링 완료");
	    	}
        }catch(IOException e) {
        	e.printStackTrace();
        }
	}
	
	private void getPlayerData() throws IOException {
		List<Map<String, String>> playerData = new ArrayList<>();
		
		// 전체선수 페이지
		Document doc = 
				Jsoup.connect("https://lol.fandom.com/wiki/Special:RunQuery/TournamentStatistics?TS%5Bpreload%5D=ByPlayer&TS%5Btournament%5D=&TS%5Blink%5D=&TS%5Bchampion%5D=&TS%5Brole%5D=&TS%5Bteam%5D=&TS%5Bpatch%5D=&TS%5Byear%5D=2023&TS%5Bregion%5D=LCK&TS%5Btournamentlevel%5D=Primary&TS%5Bwhere%5D=&TS%5Bincludelink%5D%5Bis_checkbox%5D=true&TS%5Bshownet%5D%5Bis_checkbox%5D=true&_run=&pfRunQueryFormName=TournamentStatistics&wpRunQuery=&pf_free_text=").get();
			
		List<String> playerList = doc.select(".spstats-player a").eachAttr("title");
			
		for(String player : playerList) {
			Map<String, String> playerMap = new HashMap<>();
			
			// 선수정보 페이지
			Document playerInfoDoc = 
					Jsoup.connect("https://lol.fandom.com/wiki/Special:RunQuery/TournamentStatistics?TS%5Bpreload%5D=PlayerByChampion&TS%5Btournament%5D=&TS%5Blink%5D=" + player + "&TS%5Bchampion%5D=&TS%5Brole%5D=&TS%5Bteam%5D=&TS%5Bpatch%5D=&TS%5Byear%5D=2023&TS%5Bregion%5D=LCK&TS%5Btournamentlevel%5D=Primary&TS%5Bwhere%5D=&TS%5Bincludelink%5D%5Bis_checkbox%5D=true&TS%5Bshownet%5D%5Bis_checkbox%5D=true&_run=&pfRunQueryFormName=TournamentStatistics&wpRunQuery=&pf_free_text=").get();
				
			// 닉네임(선수이름) -> 닉네임 변환
			if(player.contains("(")) {
				player = player.substring(0, player.indexOf("(")).replace(" ", "");
			}
			
			switch(player) {
				case "UmTi":
					player = "Umti";
					break;
				case "Kyeahoo":
					player = "kyeahoo";
					break;
			}
			
			String fileName = player + ".csv";
			
			playerMap.put("player", player.toUpperCase());
			playerMap.put("fileName", fileName);
			
			playerData.add(playerMap);
			
			BufferedWriter bw = new BufferedWriter(new FileWriter(context.getRealPath("/resources/csv/player/") + fileName, false));
						
			// OverAll
			Elements overall = playerInfoDoc.select(".wikitable tbody tr th:contains(Overall:)").first().siblingElements();
						
			// KDA, 분당 골드, 분당 데미지, 킬 관여율
			bw.append(overall.get(7).text() + "," + overall.get(11).text() + "," + overall.get(13).text() + "," +overall.get(14).text() + ",");
						
			// Total
			Elements total = playerInfoDoc.select(".wikitable tbody tr th:contains(Total:)").first().siblingElements();
						
			// 경기 횟수, 승리, 패배, 승률, 킬, 데스, 어시
			bw.append(total.get(0).text() + "," + total.get(1).text() + "," + total.get(2).text() + "," 
					+ total.get(3).text() + "," + total.get(4).text() + "," + total.get(5).text() + ","
					+ total.get(6).text() + "\n");
						
			// 챔피언
			Elements championRows = playerInfoDoc.select(".wikitable tr .spstats-subject");
						
			int count = 0;
						
			for(Element champion : championRows) {
				Elements championInfoRow = champion.siblingElements();
							
				String championName = champion.text();
				
				switch(championName) {
					case "Renata Glasc": 
						championName = "Renata"; 
						break;
					case "RenataGlasc":
						championName = "Renata"; 
						break;
					case "Wukong": 
						championName = "MonkeyKing"; 
						break;
					case "LeBlanc":
						championName = "Leblanc";
						break;
					case "Kai'Sa":
						championName = "Kaisa";
						break;
					case "KhaZix":
						championName = "Khazix";
						break;
					default:
						if(championName.contains("'")) championName = championName.replace("'", "");
						
						if(championName.contains(" ")) championName = championName.replace(" ", "");
				}
							
							
				// 챔피언 이름, 플레이 횟수, 승리, 패배, 승률, 킬, 데스, 어시, KDA, 분당 CS, 분당 골드, 분당 데미지
				bw.append(championName + "," + championInfoRow.get(0).text() + "," + championInfoRow.get(1).text() + "," 
						+ championInfoRow.get(2).text() + "," + championInfoRow.get(4).text() + "," + championInfoRow.get(5).text()
						+ "," + championInfoRow.get(6).text() + "," + championInfoRow.get(7).text() + "," + championInfoRow.get(9).text() 
						+ "," + championInfoRow.get(11).text() + "," + championInfoRow.get(13).text());
				
				count++;
							
				if(count > 4) break;
				else bw.append("\n");
			} if(bw != null) bw.close();
		} service.updatePlayerFile(playerData);
	}
	
	private void getMatchData() throws IOException {
		List<Map<String, String>> matchData = new ArrayList<>();
		
		List<String> matchTypeLink = List.of(
				"LCK%20Spring%202023/", "LCK%20Spring%20Playoffs%202023/", "LCK%20Summer%202023/", 
				"LCK%20Summer%20Playoffs%202023/", "LCK%20Regionals%20Finals%202023/");
		
		for(String link : matchTypeLink) {
			Document matchListDoc = Jsoup.connect("https://gol.gg/tournament/tournament-matchlist/" + link).get();
			Elements tableRow = matchListDoc.select("table tbody tr");
			
			if(!(tableRow.size() == 0)) {
				int tableRowSize = tableRow.select(".text-left a").size();
				
				for(int i=0; i<tableRowSize; i++) {
					// 경기 일정
					if (tableRow.select("a").get(i).attr("href").contains("page-summary")) {
						Map<String, String> saveMap = new HashMap<>();
						
						// 경기결과 링크
						String url = "gol.gg" + tableRow.select("a").get(i).attr("href").replace(".", "");
						// 각 세트 경기 결과 
						String gameSetResultUrl = url.replace("/page-summary/", "/page-game/");
						
						// 스코어
						char homeTeamScore = tableRow.get(i).select("td").get(2).text().charAt(0);
						char awayTeamScore = tableRow.get(i).select("td").get(2).text().charAt(4);
						
						// 세트 수
						int totalGameSetNum = Character.getNumericValue(homeTeamScore) + Character.getNumericValue(awayTeamScore);
						
						// 경기날짜
						String matchDate = tableRow.get(i).select("td").last().text();
						
						// 팀 이름
						String homeTeamName = tableRow.get(i).select("td").get(1).text();
						String awayTeamName = tableRow.get(i).select("td").get(3).text();
						
						// 팀 이름 -> 팀 약칭 
						for(String team : PARSE_TEAM_NAME.keySet()) {
							if(homeTeamName.equals(team)) {
								homeTeamName = PARSE_TEAM_NAME.get(team);
							}
							if(awayTeamName.equals(team)) {
								awayTeamName = PARSE_TEAM_NAME.get(team);
							}
						}
						
						// 파일 이름
						String fileName = matchDate + "_" + homeTeamName + "_vs_" + awayTeamName + ".csv";
						
						if(homeTeamScore > awayTeamScore) {
							saveMap.put("winner", homeTeamName);
						}else {
							saveMap.put("winner", awayTeamName);
						}
						
						saveMap.put("homeScore", String.valueOf(homeTeamScore));
						saveMap.put("awayScore", String.valueOf(awayTeamScore));
						
						// 경기 날짜
						saveMap.put("matchdate", matchDate);
						
						// 홈 팀, 어웨이 팀
						saveMap.put("homeTeamName", homeTeamName);
						saveMap.put("awayTeamName", awayTeamName);
						
						saveMap.put("fileName", fileName);
						
						matchData.add(saveMap);
						
						File csvMatchFile = new File(context.getRealPath("/resources/csv/match/") + fileName);
						File csvRuneFile = new File(context.getRealPath("/resources/csv/rune/") + fileName);
						
						if(!csvMatchFile.exists() && !csvRuneFile.exists()) {
							for(int j=0; j<totalGameSetNum; j++) {
								BufferedWriter matchWriter = 
										new BufferedWriter(new FileWriter(context.getRealPath("/resources/csv/match/") + fileName, true));

								BufferedWriter runeWriter = 
										new BufferedWriter(new FileWriter(context.getRealPath("/resources/csv/rune/") + fileName, true));
								
								// 세트 구분 숫자
								String divisionGameSet = gameSetResultUrl
										.substring(gameSetResultUrl.indexOf("/page-game/")-5, gameSetResultUrl.indexOf("/page-game/"));
								
								// 다음 세트 숫자
								int gameSetNum = Integer.parseInt(divisionGameSet) + j;
								
								// 세트 결과 페이지 주소
								String gameSetPath = gameSetResultUrl.replace(divisionGameSet, String.valueOf(gameSetNum));
								
								// 세트 결과 페이지 
								Document gameSetDoc = Jsoup.connect("https://" + gameSetPath).get();
								
								String gamePlayTime = gameSetDoc.select(".rowbreak .text-center h1").text();
								
								int playTime = Integer.parseInt(gamePlayTime.substring(0, gamePlayTime.indexOf(":")));
								
								while(playTime < 10) {
									gameSetNum = Integer.parseInt(divisionGameSet) + j + 1;
									
									// 세트 결과 페이지 주소
									gameSetPath = gameSetResultUrl.replace(divisionGameSet, String.valueOf(gameSetNum));
									
									// 세트 결과 페이지 
									gameSetDoc = Jsoup.connect("https://" + gameSetPath).get();
									
									gamePlayTime = gameSetDoc.select(".rowbreak .text-center h1").text();
									
									playTime = Integer.parseInt(gamePlayTime.substring(0, gamePlayTime.indexOf(":")));
								}
								
								// 결과요약 링크 
								String gameInfoPath = gameSetPath.replace("/page-game/", "/page-fullstats/");
								
								// 결과요약 페이지
								Document gameInfoDoc = Jsoup.connect("https://" + gameInfoPath).get();
								
								// 결과정보 배열
								String[] playerArr = gameInfoDoc.select(".completestats tbody tr").get(0).text()
										.replace("Player ", "").split(" ");
								String[] killArr = gameInfoDoc.select(".completestats tbody tr").get(3).text()
										.replace("Kills ", "").split(" ");
								String[] deathArr = gameInfoDoc.select(".completestats tbody tr").get(4).text()
										.replace("Deaths ", "").split(" ");
								String[] assistArr = gameInfoDoc.select(".completestats tbody tr").get(5).text()
										.replace("Assists ", "").split(" ");
								String[] csArr = gameInfoDoc.select(".completestats tbody tr").get(7).text().replace("CS ", "")
										.split(" ");
								String[] cpmArr = gameInfoDoc.select(".completestats tbody tr").get(10).text()
										.replace("CSM ", "").split(" ");
								String[] goldArr = gameInfoDoc.select(".completestats tbody tr").get(11).text()
										.replace("Golds ", "").split(" ");
								String[] damageArr = gameInfoDoc.select(".completestats tbody tr").get(24).text()
										.replace("Total damage to Champion ", "").split(" ");
								
								// 밴픽
								Elements banpickRows = gameSetDoc.select(".row div:containsOwn(Bans)");
								
								List<String> banpickList = new ArrayList<>();

								for(Element row : banpickRows) {
									List<String> banpickSrcList = row.nextElementSibling().select("img").eachAttr("src");
									
									for(String banpick : banpickSrcList) {
										if(banpick.contains("void.png")) {
											banpickList.add("No Ban");
										}else {
											String championName = banpick.substring(banpick.indexOf("icon/") + 5, banpick.indexOf(".png"));
											
											switch(championName) {
												case "Renata Glasc": 
													championName = "Renata"; 
													break;
												case "Wukong": 
													championName = "MonkeyKing"; 
													break;
												case "LeBlanc":
													championName = "Leblanc";
													break;
												case "KhaZix":
													championName = "Khazix";
													break;
												default:
													if(championName.contains("'")) championName = championName.replace("'", "");
													
													if(championName.contains(" ")) championName = championName.replace(" ", "");
											}
											banpickList.add(championName);
										}
									}
								}
								
								// 챔피언
								List<String> championSrcList = 
										gameSetDoc.select(".playersInfosLine td[style=white-space:nowrap] img[src*=champions]").eachAttr("src");
								
								List<String> championList = new ArrayList<>();
								
								for(String champion : championSrcList) {
									championList.add(champion.substring(champion.indexOf("icon/") + 5, champion.indexOf(".png")));
								}
								
								// 스펠
								List<String> spellSrcList = gameSetDoc.select(".playersInfosLine img[alt=Summoner spell]").eachAttr("src");
								
								List<String> spellList = new ArrayList<>();
								
								for(String spell : spellSrcList) {
									spellList.add(spell.substring(spell.indexOf("Summoner"), spell.indexOf(".png")).replace("Summoner", ""));
								}
								
								// 각 챔피언의 스펠
								Map<String, String[]> championSpellMap = new HashMap<>();
								
								for(int k=0; k<championList.size(); k++) {
									String[] spells = {spellList.get(k * 2), spellList.get(k * 2 + 1)};
									championSpellMap.put(championList.get(k), spells);
								}
								
								// 아이템
								Map<String, List<String>> itemMap = new HashMap<>();
								
								for(int k=0; k<10; k++) {
									List<String> itemList = new ArrayList<>();
									
									List<String> itemSrcList = gameSetDoc.select(".playersInfosLine tr td[colspan=3]").get(k)
											.select("img[alt=Items]").eachAttr("src");
									
									for(String item : itemSrcList) {
										if(item.contains("item")) {
											itemList.add(item.substring(item.indexOf("item"), item.indexOf(".png")).replace("item/", ""));
										}
									}
									
									itemMap.put(championList.get(k), itemList);
								}
								
								// 룬
								List<String> runeSrcList = gameSetDoc.select("span .perkztab tr img").eachAttr("src");
								
								List<String> runeList = new ArrayList<>();
								
								for(String src : runeSrcList) {
									runeList.add(src.substring(src.indexOf("style/") + 6, src.indexOf(".png")));
								}
								
								Map<String, String[]> championRuneMap = new HashMap<>();
								
								for(int k=0; k<championList.size(); k++) {
									String[] runes = 
										{
											runeList.get(k * 11), runeList.get(k * 11 + 1), runeList.get(k * 11 + 2),
											runeList.get(k * 11 + 3), runeList.get(k * 11 + 4), runeList.get(k * 11 + 5),
											runeList.get(k * 11 + 6), runeList.get(k * 11 + 7), runeList.get(k * 11 + 8),
											runeList.get(k * 11 + 9), runeList.get(k * 11 + 10)
										};
									championRuneMap.put(championList.get(k), runes);
								}
								
								// 팀 구분
								String[] lineArr = {".blue", ".red"};
								
								for(String line : lineArr) {
									// 팀 정보
									boolean isWinnerTeam = gameSetDoc.select(line + "-line-header").text().contains("WIN");
									String teamName = gameSetDoc.select(line + "-line-header a").text();
									String teamTotalKill = gameSetDoc.select(line + "_line").tagName("img").first().text();
									String teamTotalTour = gameSetDoc.select(line + "_line").tagName("img").get(1).text();
									String teamTotalDragon = gameSetDoc.select(line + "_line").tagName("img").get(2).text();
									String teamTotalBaron = gameSetDoc.select(line + "_line").tagName("img").get(3).text();
									int teamTotalHerald = gameSetDoc.select(line + "_action img[alt=Rift Herald]").size();
									
									if(isWinnerTeam) {
										matchWriter.append(PARSE_TEAM_NAME.get(teamName) + ",VICTORY," + teamTotalKill + "," + teamTotalTour 
												+ "," + teamTotalDragon + "," + teamTotalBaron + "," + teamTotalHerald + "\n");
									}else {
										matchWriter.append(PARSE_TEAM_NAME.get(teamName) + ",DEFEAT," + teamTotalKill + "," + teamTotalTour 
												+ "," + teamTotalDragon + "," + teamTotalBaron + "," + teamTotalHerald + "\n");
									}
									
									// 밴픽
									for(int k=0; k<5; k++) {
										if(line.equals(".blue")) {
											if(banpickList.get(k).equals("No Ban")) {
												matchWriter.append("\n");
											}else{
												matchWriter.append(k == 0 ? banpickList.get(k) : "," + banpickList.get(k));
												matchWriter.append(k == 4 ? "\n" : "");
											}
										}else {
											if(banpickList.get(k+5).equals("No Ban")) {
												matchWriter.append("\n");
											}else {
												matchWriter.append(k == 0 ? banpickList.get(k+5) : "," + banpickList.get(k+5));
												matchWriter.append(k == 4 ? "\n" : "");
											}
										}
									}
								}
								
								for(int k=0; k<championList.size(); k++) {
									int kill = Integer.parseInt(killArr[k]);
									int death = Integer.parseInt(deathArr[k]);
									int assist = Integer.parseInt(assistArr[k]);
									
									double avgNum = (death == 0) ? (kill + assist) : ((double)(kill + assist) / death);
									
									String avg = new DecimalFormat("0.0").format(avgNum);
									
									matchWriter.append(playerArr[k] + "\n");
									
									String championName = championList.get(k);
									
									String[] spell = championSpellMap.get(championName);
									
									List<String> itemList = itemMap.get(championName);
									
									String[] rune = championRuneMap.get(championName);
									
									switch(championName) {
										case "Renata Glasc": 
											championName = "Renata"; 
											break;
										case "RenataGlasc":
											championName = "Renata"; 
											break;
										case "Wukong": 
											championName = "MonkeyKing"; 
											break;
										case "LeBlanc":
											championName = "Leblanc";
											break;
										case "KaiSa":
											championName = "Kaisa";
											break;
										case "KhaZix":
											championName = "Khazix";
											break;
										default:
											if(championName.contains("'")) championName = championName.replace("'", "");
											
											if(championName.contains(" ")) championName = championName.replace(" ", "");
									}
									
									runeWriter.append(championName.substring(0, 1).toUpperCase() + championName.substring(1) + ",");
									
									for(int m=0; m<rune.length; m++) {
										runeWriter.append(rune[m] + (m == rune.length -1 ? "" : ","));
									}
									
									if(!(j == totalGameSetNum - 1) && k == 9) {
										runeWriter.append("\n|\n");
									}else if(k < 9) {
										runeWriter.append("\n");
									}
									
									matchWriter.append(championName.substring(0, 1).toUpperCase() + championName.substring(1) + ",");
									
									matchWriter.append(spell[0] + "," + spell[1] + ",");
									
									for(int m=0; m<itemList.size(); m++) {
										matchWriter.append(itemList.get(m));
										matchWriter.append(m == itemList.size() - 1 ? "\n" : ",");
									}
									
									matchWriter.append(killArr[k] + "/" + deathArr[k] + "/" + assistArr[k] + "," + avg + "," + csArr[k]
											+ "," + cpmArr[k] + "," + goldArr[k] + "," + damageArr[k]);
									
									if(!(j == totalGameSetNum - 1) && k == 9) {
										matchWriter.append("\n|\n");
									}else if(k < 9) {
										matchWriter.append("\n");
									}
								}
								if(matchWriter != null) matchWriter.close();
								if(runeWriter != null) runeWriter.close();
								log.debug(fileName + " 업데이트 되었습니다.");
							}
						}
					}
				}
			}				
		} service.updateMatchFile(matchData);
	}
	
	private void getMatchSchedule() throws IOException {
		List<Map<String, String>> matchData = new LinkedList<>();

		List<String> matchTypeLink = List.of(
				"LCK%20Spring%202023/", "LCK%20Spring%20Playoffs%202023/", "LCK%20Summer%202023/",
				"LCK%20Summer%20Playoffs%202023/", "LCK%20Regionals%20Finals%202023/");
		
		for(String link : matchTypeLink) {
			Document matchListDoc = Jsoup.connect("https://gol.gg/tournament/tournament-matchlist/" + link).get();
			Elements tableRow = matchListDoc.select("table tbody tr");
			
			if(!(tableRow.size() == 0)) {
				int tableRowSize = tableRow.select(".text-left a").size();
				
				for(int i=tableRowSize-1; i>=0; i--) {
					if(tableRow.select("a").get(i).attr("href").contains("page-preview")) {
						Map<String, String> saveMap = new HashMap<>();
						
						// 경기날짜
						String matchDate = tableRow.get(i).select("td").last().text();
						
						// 팀 이름
						String homeTeamName = tableRow.get(i).select("td").get(1).text();
						String awayTeamName = tableRow.get(i).select("td").get(3).text();
						
						if(homeTeamName != null || awayTeamName != null) {
							// 팀 이름 -> 팀 약칭 
							for(String team : PARSE_TEAM_NAME.keySet()) {
								if(homeTeamName.equals(team)) {
									homeTeamName = PARSE_TEAM_NAME.get(team);
								}
								if(awayTeamName.equals(team)) {
									awayTeamName = PARSE_TEAM_NAME.get(team);
								}
							}
							
							// 경기 날짜
							saveMap.put("matchdate", matchDate);
							
							// 홈 팀, 어웨이 팀
							saveMap.put("homeTeamName", homeTeamName);
							saveMap.put("awayTeamName", awayTeamName);

							matchData.add(saveMap);
						}
					}
				}
			}
		} service.updateMatchTeam(matchData);
	}
	
	private void getTeamRanking() throws IOException {
		Document doc = Jsoup.connect("https://lol.fandom.com/wiki/LCK/2023_Season/Summer_Season").get();
		
		Elements table = doc.select(".standings .teamhighlighter");
		
		List<Map<String, String>> teamRankingList = new ArrayList<>();
		
		for(int i=0; i<table.size(); i++) {
			Map<String, String> saveMap = new HashMap<>();

			String matchs = table.get(i).select("td").get(2).text();
			String games = table.get(i).select("td").get(4).text();
			
			saveMap.put("ranking", table.get(i).select("td").get(0).text());
			saveMap.put("teamName", table.get(i).select(".teamname a").text());
			saveMap.put("matchWins", matchs.substring(0, matchs.indexOf("-") - 1));
			saveMap.put("matchDefeats", matchs.substring(matchs.indexOf("-") + 2));
			saveMap.put("gameWins", games.substring(0, matchs.indexOf("-")));
			saveMap.put("gameDefeats", games.substring(matchs.indexOf("-") + 2));
			
			teamRankingList.add(saveMap);
		} service.updateTeamRanking(teamRankingList);
	}
	
	private void getRegionalMatch() throws IOException {
		Document doc = Jsoup.connect("https://lol.fandom.com/wiki/LCK/2023_Season/Regional_Finals").get();
		
		Elements table = doc.select(".matchlist");
		
		List<Map<String, String>> regionalMatchMap = new ArrayList<>();
		
		List<String> matchList = table.select("[data-date]").eachAttr("data-date").stream().collect(Collectors.toList());
		
		for(String match : matchList) {
			Map<String, String> saveMap = new HashMap<>();
			
			String homeTeamName = table.select("tr[data-date=" + match + "] .matchlist-team1 .teamname").text();
			String awayTeamName = table.select("tr[data-date=" + match + "] .matchlist-team2 .teamname").text();
			
			if(!(homeTeamName.equals("TBD") && awayTeamName.equals("TBD"))) {
				saveMap.put("homeTeamName", homeTeamName);
				saveMap.put("awayTeamName", awayTeamName);
				saveMap.put("matchDate", match);
				regionalMatchMap.add(saveMap);
			}
		} service.updateRegionalMatch(regionalMatchMap);
	}
	
	private void champPredictCompare() {
	    String path = context.getRealPath("/resources/csv/match/");
	    List<Integer> noList = new ArrayList<>();
	    

	    List<Map<String, Object>> matchResultList = predictService.selectMatchData();

	    for(Map<String, Object> matchResult : matchResultList) {
	        File file = new File(path + String.valueOf(matchResult.get("MS_FILE_NAME")));

	        if(!file.exists()) {
	            log.warn("File not found: {}", file);
	            continue;
	        }

	        List<List<String[]>> setResults = csvParser(path + String.valueOf(matchResult.get("MS_FILE_NAME")));
	        List<String> matchBanList = setResults.stream()
	                .flatMap(Collection::stream)
	                .flatMap(Arrays::stream)
	                .distinct()
	                .collect(Collectors.toList());
	        
	        List<Integer> list = predictService.selectYesterDayPredict();
	        
	        for(int no : list) {
	            noList.add(no);

	            List<String> banpickList = predictService.selectMemberPredict(no).stream()
	                    .map(c -> c.equals("Thresh") ? "Xerath" : c)
	                    .collect(Collectors.toList());
	            
	            List<String> answerBanList = 
						matchBanList.stream()
						.filter(b -> banpickList.stream().anyMatch(Predicate.isEqual(b)))
						.collect(Collectors.toList());
	            
	            predictService.updateMemberScore(Map.of("no", no, "score", answerBanList.size()));
	        }
	    }
	    predictService.updateMemberPoiont();
	    noList.stream().forEach(predictService::insertPointHistory);
	}
	
	private List<List<String[]>> csvParser(String fullPath) {
		final List<List<String[]>> setResultsTotal = new ArrayList<>();

		try(CSVReader csvReader = new CSVReader(new FileReader(fullPath));) {
			List<String[]> setResult = new ArrayList<>();
			for (String[] line : csvReader.readAll()) {
				if (Arrays.equals(line, new String[] {"|"})) {
					setResultsTotal.add(setResult);
					setResult = new ArrayList<>();
					continue;
				}
				setResult.add(line);
			}
			setResultsTotal.add(setResult);
		}catch(CsvException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		return setResultsTotal;
	}
}
