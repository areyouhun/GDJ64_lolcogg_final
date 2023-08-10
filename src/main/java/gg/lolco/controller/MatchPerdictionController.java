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
import gg.lolco.model.vo.MatchPredictionCommentBn;
import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberEmoticon;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

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

		// 내가 가진 이모티콘
		List<MemberEmoticon> myEmo = new ArrayList<>();
		if(member != null) {
			myEmo = service.myEmo(member.getEmail());
		}
		m.addAttribute("myEmo", myEmo);
		
		// 업데이트
		int mpYn = service.updateMpYn();
		
		// 내 적중률, 전체 적중률 랭킹
		List<MatchPrediction> myMpSuccess = new ArrayList<>();
		List<MatchPrediction> mpSuccess = service.mpSuccess(null);
		if(member != null) {
			String nickname = member.getNickname();
			myMpSuccess = service.mpSuccess(nickname);
		}
		m.addAttribute("mpSuccess", mpSuccess);
		m.addAttribute("myMpSuccess", myMpSuccess);
		
		// 내 예측
		List<MatchPrediction> myMp = new ArrayList<>();
		if(member != null) {
			myMp = service.myMp(member.getEmail());
		}
		m.addAttribute("myMp", myMp);
		
		// 내 버프 너프
		List<MatchPredictionCommentBn> myBn = new ArrayList<>();
		if(member != null) {
		myBn = service.myBn(member.getEmail());
		}
		m.addAttribute("myBn", myBn);
		
		// 예측 퍼센트
		List<MatchPrediction> mpPercentage = service.mpPercentage();
		m.addAttribute("mpPercentage", mpPercentage);
		
		return "matchprediction/matchprediction";
	}
	
	// 경기 주차 변경(ajax)
	@PostMapping("/matchPrediction/week")
	@ResponseBody
	public List weekChoice(int week, @SessionAttribute(name = "loginMember", required = false) Member member){
		List weekChoice = new ArrayList<>();
		
		int mpYn = service.updateMpYn();
		List<MatchSchedule> ms = service.matchScheduleByWeek(week);
		weekChoice.add(ms);
		
		// 내 예측
		List<MatchPrediction> myMp = new ArrayList<>();
		if(member != null) {
			myMp = service.myMp(member.getEmail());
			weekChoice.add(myMp);
		}
		
		// 예측 퍼센트
		List<MatchPrediction> mpPercentage = service.mpPercentage();
		weekChoice.add(mpPercentage);
		
		return weekChoice;
	}
	
	// 승부예측 선택(ajax)
	@PostMapping("/matchprediction/choice")
	@ResponseBody
	public int teamChoice(@RequestParam Map param){
		int result = service.teamChoice(param);
		return result;
	}
	
	// 댓글 등록(ajax)
	@PostMapping("/matchprediction/insertComment")
	@ResponseBody
	public MatchPredictionComment insertComment(@RequestParam Map param) {
		int result = service.insertComment(param);
		int week = Integer.parseInt((String.valueOf(param.get("week"))));
		MatchPredictionComment myComment = service.selectComment(param);
		if(result > 0) {
			return myComment;
		} else {
			return null;
		}
	}
	
	// 댓글 삭제(ajax)
	@PostMapping("/matchprediction/deleteComment")
	@ResponseBody
	public int deleteComment(@RequestParam String mpcNo) {
		int result = service.deleteComment(mpcNo);
		return result;
	}
	
	// 댓글 버프너프
	@PostMapping("/matchprediction/commentBn")
	@ResponseBody
	public MatchPredictionComment commentBn(@RequestParam Map param) {
		int result = service.commentBnDelete(param);
		result += service.commentBn(param);
		
		// 버프시 너프 카운트, 너프시 버프 카운트
		MatchPredictionComment countBn = service.countBn(param);
		return countBn;
	}
	
	// 댓글 수정
	@PostMapping("/matchprediction/updateComment")
	@ResponseBody
	public MatchPredictionComment updateCommnet(@RequestParam Map param) {
		int result = service.updateComment(param);
		if(result > 0) {
			MatchPredictionComment comment = service.selectComment(param);
			return comment;
		}
		return null;
	}
	
	
}
