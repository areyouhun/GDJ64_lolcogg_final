package gg.lolco.common.scheduler;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import gg.lolco.controller.SchedulerController;

@Component
public class CrawlingScheduler {
	
	private final SchedulerController controller;
	private final ServletContext context;
	
	private final Map<String, String> PARSE_TEAM_NAME = Map.of(
			"Gen.G eSports", "GEN", "Dplus KIA", "DK", 
			"Nongshim RedForce", "NS", "BRION", "BRO",
			"DRX", "DRX", "Hanwha Life eSports", "HLE",
			"KT Rolster", "KT", "T1", "T1",
			"Liiv SANDBOX", "LSB", "Kwangdong Freecs", "KDF");
	
	public CrawlingScheduler(SchedulerController controller, ServletContext context) {
		this.controller = controller;
		this.context = context;
	}
	
	@Scheduled(fixedDelay=3600000)
	public void catchExceptionMethod() {
		try {
			getPlayerData();
			getMatchData();
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
			
			String fileName = player + ".csv";
			
			playerMap.put("player", player.toUpperCase());
			playerMap.put("fileName", fileName);
			
			playerData.add(playerMap);
			
			// 선수정보 페이지
			Document playerInfoDoc = 
					Jsoup.connect("https://lol.fandom.com/wiki/Special:RunQuery/TournamentStatistics?TS%5Bpreload%5D=PlayerByChampion&TS%5Btournament%5D=&TS%5Blink%5D=" + player + "&TS%5Bchampion%5D=&TS%5Brole%5D=&TS%5Bteam%5D=&TS%5Bpatch%5D=&TS%5Byear%5D=2023&TS%5Bregion%5D=LCK&TS%5Btournamentlevel%5D=Primary&TS%5Bwhere%5D=&TS%5Bincludelink%5D%5Bis_checkbox%5D=true&TS%5Bshownet%5D%5Bis_checkbox%5D=true&_run=&pfRunQueryFormName=TournamentStatistics&wpRunQuery=&pf_free_text=").get();
				
			// 닉네임(선수이름) -> 닉네임 변환
			if(player.contains("(")) {
				player = player.substring(0, player.indexOf("(")).replace(" ", "");
			}

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
							
							
				// 챔피언 이름, 플레이 횟수, 승리, 패배, 승률, 킬, 데스, 어시, KDA, 분당 CS, 분당 골드, 분당 데미지
				bw.append(championName + "," + championInfoRow.get(0).text() + "," + championInfoRow.get(1).text() + "," 
						+ championInfoRow.get(2).text() + "," + championInfoRow.get(4).text() + "," + championInfoRow.get(5).text()
						+ "," + championInfoRow.get(6).text() + "," + championInfoRow.get(7).text() + "," + championInfoRow.get(9).text() 
						+ "," + championInfoRow.get(11).text() + "," + championInfoRow.get(13).text());
				
				count++;
							
				if(count > 4) break;
				else bw.append("\n");
			} if(bw != null) bw.close();
		} controller.updatePlayerFile(playerData);
	}
	
	private void getMatchData() throws IOException {
		List<Map<String, String>> matchData = new ArrayList<>();
		
		// 경기일정 페이지
		Document doc = Jsoup.connect("https://gol.gg/tournament/tournament-matchlist/LCK%20Spring%202023/").get();
		
		List<String> matchTypeLink = doc.select("#gameMenuToggler .navbar-nav li a").eachAttr("href");
		
		for(String link : matchTypeLink) {
			Document matchListDoc = Jsoup.connect("https://gol.gg" + link.substring(2).replace("stats", "matchlist")).get();
			
			Elements tableRow = matchListDoc.select("table tbody tr");
			
			int tableRowSize = tableRow.select(".text-left a").size();

			for(int i=0; i<tableRowSize; i++) {
				// 경기 일정
				if (tableRow.select("a").get(i).attr("href").contains("page-summary")) {
					Map<String, String> saveMap = new HashMap<>();
					
					// 경기결과 링크
					String url = "gol.gg" + tableRow.select("a").get(i).attr("href").replace(".", "");
					// 각 세트 경기 결과 
					String gameSetResultUrl = url.replace("/page-summary/", "/page-game/");
					// 결과요약 링크 
					String gameInfoPath = url.replace("/page-summary/", "/page-fullstats/");
					
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
					
					for(int j=0; j<totalGameSetNum; j++) {
						BufferedWriter bw = 
								new BufferedWriter(new FileWriter(context.getRealPath("/resources/csv/match/") + fileName, true));

						// 세트 구분 숫자
						String divisionGameSet = gameSetResultUrl
								.substring(gameSetResultUrl.indexOf("/page-game/")-5, gameSetResultUrl.indexOf("/page-game/"));
						
						// 다음 세트 숫자
						int gameSetNum = Integer.parseInt(divisionGameSet) + j;
						
						
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
						
						// 세트 결과 페이지 주소
						String gameSetPath = gameSetResultUrl.replace(divisionGameSet, String.valueOf(gameSetNum));
						
						// 세트 결과 페이지 
						Document gameSetDoc = Jsoup.connect("https://" + gameSetPath).get();
						
						// 밴픽
						List<String> banpickSrcList = gameSetDoc.select("a.black_link img").eachAttr("src");
						
						List<String> banpickList = new ArrayList<>();
						
						for(String banpick : banpickSrcList) {
							if(!gameSetDoc.select("img[alt=No ban]").isEmpty()) {
								banpickList.add("No ban");
							}
							banpickList.add(banpick.substring(banpick.indexOf("icon/") + 5, banpick.indexOf(".png")));
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
								itemList.add(item.substring(item.indexOf("item"), item.indexOf(".png")).replace("item/", ""));
							}
							
							itemMap.put(championList.get(k), itemList);
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
								bw.append(PARSE_TEAM_NAME.get(teamName) + ",VICTORY," + teamTotalKill + "," + teamTotalTour 
										+ "," + teamTotalDragon + "," + teamTotalBaron + "," + teamTotalHerald + "\n");
							}else {
								bw.append(PARSE_TEAM_NAME.get(teamName) + ",DEFEAT," + teamTotalKill + "," + teamTotalTour 
										+ "," + teamTotalDragon + "," + teamTotalBaron + "," + teamTotalHerald + "\n");
							}
							
							// 밴픽
							for(int k=0; k<5; k++) {
								if(line.equals(".blue")) {
									bw.append(banpickList.get(k).substring(0, 1).toUpperCase() + banpickList.get(k).substring(1));
									bw.append(k < 4 ? "," : "\n");
								}else {
									bw.append(banpickList.get(k + 5).substring(0, 1).toUpperCase() + banpickList.get(k).substring(1));
									bw.append(k < 4 ? "," : "\n");
								}
							}
						}
						
						for(int k=0; k<championList.size(); k++) {
							int kill = Integer.parseInt(killArr[k]);
							int death = Integer.parseInt(deathArr[k]);
							int assist = Integer.parseInt(assistArr[k]);
							
							double avgNum = (k == 0) ? (kill + assist) : ((double)(kill + assist) / death);
							
							String avg = new DecimalFormat("0.0").format(avgNum);
							
							bw.append(playerArr[k] + "\n");
							
							String championName = championList.get(k);
							
							String[] spell = championSpellMap.get(championName);
							
							List<String> itemList = itemMap.get(championName);
							
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
							
							bw.append(championName.substring(0, 1).toUpperCase() + championName.substring(1) + ",");
							
							bw.append(spell[0] + "," + spell[1] + ",");
							
							for(int m=0; m<itemList.size(); m++) {
								bw.append(itemList.get(m));
								bw.append(m == itemList.size() - 1 ? "\n" : ",");
							}
							
							bw.append(killArr[k] + "/" + deathArr[k] + "/" + assistArr[k] + "," + avg + "," + csArr[k]
									+ "," + cpmArr[k] + "," + goldArr[k] + "k," + damageArr[k]);
							
							if(!(j == totalGameSetNum - 1) && k == 9) {
								bw.append("\n|\n");
							}
						}
						if(bw != null) bw.close();
					}
				}
			}				
		}
		controller.updateMatchFile(matchData);
	}
	
}
