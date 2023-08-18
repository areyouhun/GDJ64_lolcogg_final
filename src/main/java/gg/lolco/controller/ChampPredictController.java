package gg.lolco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import gg.lolco.model.service.ChampPredictService;
import gg.lolco.model.service.MemberService;
import gg.lolco.model.vo.Member;

@Controller
@RequestMapping("/champion_predict")
public class ChampPredictController {
	
	private final ChampPredictService service;
	private final MemberService memberService;
	
	public ChampPredictController(
			ChampPredictService service, MemberService memberService) {
		this.service = service;
		this.memberService = memberService;
	}
	
	@GetMapping("/predict_home")
	public String predictHome(Model model) {	
		model.addAttribute("matchData", service.selectMatchDate());
		return "/champion_predict/predict_home";
	}
	
	@PostMapping("/predict_play")
	public String predictPlay(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Member member,
			String homeTeam, String awayTeam, String matchDate) 
	{	
		if(member == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			model.addAttribute("loc", "/member/loginPage");
			return "/common/msg";
		}
		
		boolean isPlay = service.selectPredictYn(member.getEmail()).equals("Y");
		
		if(isPlay) {
			model.addAttribute("msg", "하루에 한번만 참여 가능합니다.");
			model.addAttribute("loc", "/champion_predict/predict_home");
			return "/common/msg";
		}
		
		model.addAttribute("homeTeam", homeTeam);
		model.addAttribute("awayTeam", awayTeam);
		model.addAttribute("matchDate", matchDate);
		return "/champion_predict/predict_play";
	}
	
	@PostMapping("/predict_submit")
	public String predictSubmit(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member member,
			@RequestParam List<String> list, String homeTeam, String awayTeam, String matchDate)
	{	
		if(member == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			model.addAttribute("loc", "/member/loginPage");
			return "/common/msg";
		}
		
		service.updatePlayYn(member.getEmail());
		
		Map<String, String> perdictMap = 
				Map.of("email", member.getEmail(), "home", homeTeam, "away", awayTeam, "matchDate", matchDate);
		
		service.insertChampPredict(perdictMap);
		
		for(String banpick : list) {
			service.insertBanpickPredict(Map.of("banpick", banpick));	
		}
		
		return "redirect:/";
	}
}
