package gg.lolco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "teamdata/team";
	}
	
	@GetMapping("/player")
	public String player(String nickname, Model model) {
		model.addAttribute("player", service.selectPlayerByNickname(nickname.toLowerCase()));
		return "teamdata/player";
	}
}
