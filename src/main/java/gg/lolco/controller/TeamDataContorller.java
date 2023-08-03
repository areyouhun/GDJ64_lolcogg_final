package gg.lolco.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		final String path = session.getServletContext().getRealPath("/resources/csv/");
		final Map<String, Object> matchResult = service.selectMatchResultByKeyword(keyword);
		
		try (InputStream is = new FileInputStream(path + matchResult.get("MS_FILE_NAME"));
			InputStreamReader isr = new InputStreamReader(is);
				BufferedReader br = new BufferedReader(isr);) {
			String data;
			while ((data = br.readLine()) != null) {
				System.out.println(data);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("matchResult", matchResult);
		return "teamdata/matchResult";
	}
}
