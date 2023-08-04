package gg.lolco.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvException;

import gg.lolco.common.MatchHistoryFormatter;
import gg.lolco.model.service.TeamDataService;

@Controller
@RequestMapping("/teamdata")
public class TeamDataContorller {
	private final TeamDataService service;
	
	public TeamDataContorller(TeamDataService service) {
		this.service = service;
	}
	
	@GetMapping("/team")
	public String team(String abbr, Model model) {
		model.addAttribute("team", service.selectTeamByAbbr(abbr));
		model.addAttribute("matchSchedule", service.selectMatchScheduleByAbbr(abbr));
		model.addAttribute("matchHistory", service.selectMatchHistoryByAbbr(abbr));
		return "teamdata/team";
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
}
