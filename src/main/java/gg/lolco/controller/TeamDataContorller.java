package gg.lolco.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvException;

import gg.lolco.common.HttpRuneClient;
import gg.lolco.common.MatchHistoryFormatter;
import gg.lolco.model.service.TeamDataService;

@Controller
@RequestMapping("/teamdata")
public class TeamDataContorller {
	private final TeamDataService service;
	private final HttpRuneClient client;
	
	public TeamDataContorller(TeamDataService service, HttpRuneClient client) {
		this.service = service;
		this.client = client;
	}
	
	@GetMapping("/team")
	public String team(String abbr, Model model) {
		model.addAttribute("team", service.selectTeamByAbbr(abbr));
		model.addAttribute("matchSchedule", service.selectMatchScheduleByAbbr(abbr));
		model.addAttribute("matchHistory", service.selectMatchHistoryByAbbr(abbr));
		return "teamdata/team";
	}
	
	@GetMapping("/comparison")
	public String compareTeams(String teamLeft, String teamRight, Model model) {
		final Map<String, String> teams = Map.of("teamLeft", teamLeft, "teamRight", teamRight);
		
		model.addAttribute("matchHistory", service.selectMatchHistoryByTeams(teams));
		model.addAttribute("teamLeft", service.selectTeamByAbbr(teamLeft));
		model.addAttribute("teamRight", service.selectTeamByAbbr(teamRight));
		model.addAttribute("numOfMatches", service.selectCountMatchesOfTeams(teams));
		model.addAttribute("numOfTeamLeftWins", service.selectCountTeamLeftWins(teams));
		return "teamdata/comparison";
	}
	
	@GetMapping("/player")
	public String player(String nickname, Model model) {
		model.addAttribute("player", service.selectPlayerByNickname(nickname.toLowerCase()));
		return "teamdata/player";
	}
	
	@GetMapping("/matchResult")
	public String matchResult(@RequestParam Map<String, String> keyword, 
											Model model, HttpSession session) 
	{
		final String path = session.getServletContext().getRealPath("/resources/csv/match/");
		final Map<String, Object> matchResultSummary = service.selectMatchResultByKeyword(keyword);
		
		final List<List<String[]>> setResults = csvParser(path + String.valueOf(matchResultSummary.get("MS_FILE_NAME")));
		final List<Map<String, Object>> matchResultDetail = MatchHistoryFormatter.format(setResults, ",");
		
		model.addAttribute("matchResultSummary", matchResultSummary);
		model.addAttribute("matchResultDetail", matchResultDetail);
		model.addAttribute("rune", client.getRune());
		return "teamdata/matchResult";
	}
	
	private List<List<String[]>> csvParser(String fullPath) {
		final List<List<String[]>> setResultsTotal = new ArrayList<>();
		
		try (CSVReader csvReader = new CSVReader(new FileReader(fullPath));) {
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
		} catch (CsvException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return setResultsTotal;
	}
	
	@GetMapping("getMatchChampionRune")
	@ResponseBody
	public List<Map<String, Object>> getMatchChampionRune(@RequestParam Map<String, String> keyword, 
																		HttpSession session)
	{
		final String path = session.getServletContext().getRealPath("/resources/csv/rune/");
		
		String role = keyword.remove("role");
		
		final Map<String, Object> matchResultSummary = service.selectMatchResultByKeyword(keyword);
		
		final List<List<String[]>> setRuneResults = csvParser(path + String.valueOf(matchResultSummary.get("MS_FILE_NAME")));
		final List<Map<String, Object>> matchRuneDetail = MatchHistoryFormatter.runeFormat(setRuneResults, ",");
		
		return client.getParseRune(getRuneOfRole(matchRuneDetail, role));
	}
	
	private List<Map<String, Object>> getRuneOfRole(List<Map<String, Object>> matchRuneDetail, String role) 
	{
		List<Map<String, Object>> dataList = new LinkedList<>();
		
		for(Map<String, Object> map : matchRuneDetail) {
			Map<String, Object> dataMap = new HashMap<>();
			
			if(map.containsKey(role)) {
				dataMap.put("champion", map.get(role));
				dataMap.put("runeCategory", map.get(role + "MainCategory"));
				dataMap.put("mainRune", map.get(role + "MainRune"));
				dataMap.put("mainRuneFirstRow", map.get(role + "MainRuneFirstRow"));
				dataMap.put("mainRuneSecondRow", map.get(role + "MainRuneSecondRow"));
				dataMap.put("mainRuneLastRow", map.get(role + "MainRuneLastRow"));
				dataMap.put("subCategory", map.get(role + "SubCategory"));
				dataMap.put("subRuneFirstRow", map.get(role + "SubRuneFirstRow"));
				dataMap.put("subRuneLastRow", map.get(role + "SubRuneLastRow"));
				dataMap.put("attributeFirstRow", map.get(role + "RunAttributeFirstRow"));
				dataMap.put("attributeSecondRow", map.get(role + "RunAttributeSecondRow"));
				dataMap.put("attributeLastRow", map.get(role + "RunAttributeLastRow"));
				
				dataList.add(dataMap);
			}
		} 
		return dataList;
	}
}
