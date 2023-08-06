package gg.lolco.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import gg.lolco.model.service.MatchPredictionService;
import gg.lolco.model.vo.MatchPrediction;
import gg.lolco.model.vo.MatchPredictionComment;
import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({"loginMember"})
public class MatchPerdictionController {
	
	private MatchPredictionService service;

	public MatchPerdictionController(MatchPredictionService service) {
		this.service = service;
	}

	// 승부예측 페이지 들어올 때
	@RequestMapping("/matchprediction")
	public String matchPrediction(Model m, @SessionAttribute(name = "loginMember", required = false) Member member) {

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
		
		// 댓글 리스트
		List<MatchPredictionComment> commentList = service.commentListAll(nowWeek);
		m.addAttribute("commentList", commentList);

		// 베스트3 댓글
		List<MatchPredictionComment> bestCommentList = service.bestCommentList(nowWeek);
		m.addAttribute("bestCommentList", bestCommentList);

		
		// 업데이트
		int mpYn = service.updateMpYn();
		
		// 내 적중률, 전체 적중률 랭킹
		List<MatchPrediction> myMpSuccess = new ArrayList<>();
		if(member != null) {
			String nickname = member.getNickname();
			myMpSuccess = service.mpSuccess(nickname);
		}
		List<MatchPrediction> mpSuccess = service.mpSuccess(null);
		m.addAttribute("mpSuccess", mpSuccess);
		m.addAttribute("myMpSuccess", myMpSuccess);
		
		// 내 예측
		List<MatchPrediction> myMp = new ArrayList<>();
		if(member != null) {
			myMp = service.myMp(member.getEmail());
			log.info("@@@@@@@@@{}", myMp);
		}
		m.addAttribute("myMp", myMp);
		
		return "matchprediction/matchprediction";
	}
	
	// 경기 주차 변경(ajax)
	@PostMapping("/matchPrediction/week")
	@ResponseBody
	public List<MatchSchedule> weekChoice(int week){
		int mpYn = service.updateMpYn();
		List<MatchSchedule> ms = service.matchScheduleByWeek(week);
		return ms;
	}
	
	// 승부예측 선택(ajax)
	@PostMapping("matchprediction/choice")
	@ResponseBody
	public int teamChoice(@RequestParam Map param){
		int result = service.teamChoice(param);
		return result;
	}
}
