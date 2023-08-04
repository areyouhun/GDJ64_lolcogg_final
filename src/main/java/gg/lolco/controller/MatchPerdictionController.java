package gg.lolco.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.lolco.model.service.MatchPredictionService;
import gg.lolco.model.vo.MatchSchedule;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MatchPerdictionController {

	private MatchPredictionService service;

	public MatchPerdictionController(MatchPredictionService service) {
		this.service = service;
	}

	// 승부예측 페이지 들어올 때
	@RequestMapping("/matchprediction")
	public String matchPrediction(Model m) {

		// 예측 참여 인원 수
		int playerCount = service.playerCount();
		m.addAttribute("playerCount", playerCount);

		// 현재 진행중인 경기주차 수
		int nowWeek = service.nowWeek();
		m.addAttribute("nowWeek", nowWeek);

		// 총 경기 주차 수
		List<MatchSchedule> week = service.week();
		m.addAttribute("week", week);

		// 경기 일정 및 팀 순위
		List<MatchSchedule> ms = service.matchScheduleByWeek(nowWeek);
		m.addAttribute("ms", ms);
		
		// 예측 성공 유무 업데이트
		// 		승리팀, 선택한 팀
//		List<MatchPrediction> msmp = service.matchMpYn();
		
		// 		업데이트
		int mpYn = service.updateMpYn();

		return "matchprediction/matchprediction";
	}
	
	// 경기 주차 변경
	@PostMapping("/matchPrediction/week")
	@ResponseBody
	public List<MatchSchedule> weekChoice(int week){
		List<MatchSchedule> ms = service.matchScheduleByWeek(week);
		return ms;
	}
}
