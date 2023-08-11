package gg.lolco.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.lolco.model.service.MainPageService;
import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.Team;
import lombok.extern.slf4j.Slf4j;

@Controller
@ResponseBody
@Slf4j
public class MainPageController {
	
	private MainPageService service;

	public MainPageController(MainPageService service) {
		this.service = service;
	}
	
	@GetMapping("/mainPage")
	public List index() {
		
		List mainPage = new ArrayList<>();
		
		// 팀 순위
		List<Team> t = service.teamRank();
		// 오늘 경기
		List<MatchSchedule> ms = service.todayMs();
		
		mainPage.add(t);
		mainPage.add(ms);
		
		return mainPage;
	}
}
