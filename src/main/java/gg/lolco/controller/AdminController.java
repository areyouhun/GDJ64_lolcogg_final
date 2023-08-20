package gg.lolco.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import gg.lolco.common.AESEncryptor;
import gg.lolco.common.PageFactory;
import gg.lolco.model.service.CommunityService;
import gg.lolco.model.service.MatchPredictionService;
import gg.lolco.model.service.MemberService;
import gg.lolco.model.service.MypageService;
import gg.lolco.model.service.ReportService;
import gg.lolco.model.service.StoreService;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.Report;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {
	
	private StoreService storeServiceservice;
	
	private CommunityService communityService;

	private MatchPredictionService mathchService;

	private ReportService service;

	private MemberService memberService;

	private MypageService mypageService;

	public AdminController(ReportService service, CommunityService communityService, StoreService storeServiceservice,
			MatchPredictionService mathchService, MemberService memberService, MypageService mypageService) {
		this.service = service;
		this.communityService = communityService;
		this.storeServiceservice = storeServiceservice;
		this.mathchService = mathchService;
		this.memberService = memberService;
		this.mypageService = mypageService;
	}
	
	@GetMapping("/memberManagement")
	public String memberManagement(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, Model model) {
		
		// SANGJUN
		List<Member> memberList = memberService.memberList(Map.of("cPage", cPage, "numPerpage", numPerpage));
		for(Member member: memberList) {
			try {
				member.setEmail(AESEncryptor.decrypt(member.getEmail()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int totalData = memberService.memberListCount();
		model.addAttribute("memberList", memberList);
		model.addAttribute("totalData", totalData);
		model.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "memberManagement","fn_paging"));
		return "/admin/memberManagement";
	}
	
	// admin/mypage.do
	@RequestMapping("/withdrawalEmail")
	@ResponseBody
	public String WithdrawalEmail(@RequestParam Map<Object, String> param, SessionStatus status) {
		System.out.println("email:" + param.get("email"));
		System.out.println("회원탈퇴처리");
		try {
			param.put("email", AESEncryptor.encrypt(param.get("email")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		int result = mypageService.WithdrawalEmail(param);
		if(!status.isComplete()) status.setComplete();
		return "redirect:/";
	}

	// admin/mypage.do, admin/memberManagement
	@RequestMapping("/restoreEmail")
	@ResponseBody
	public String restoreEmail(@RequestParam Map<Object, String> param, SessionStatus status) {
		System.out.println("email:" + param.get("email"));
		System.out.println("회원복구처리");
		try {
			param.put("email", AESEncryptor.encrypt(param.get("email")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		int result = mypageService.restoreEmail(param);
		return "redirect:/";
	}
	
	@GetMapping("/storeManagement")
	public String storeManagement(Model model) {
		// JOONHO
		model.addAttribute("saleListAll",storeServiceservice.saleListAll(0));
		model.addAttribute("saleListOne",storeServiceservice.saleListAll(1));
		model.addAttribute("saleListWeek",storeServiceservice.saleListAll(7));
		return "/admin/storeManagement";
	}
	
	@PostMapping("/changePrice")
	@ResponseBody
	public void changePrice(int price,int itemNo) {
		Map<String,Object> param=new HashMap<>();
		param.put("price", price);
		param.put("itemNo", itemNo);
		int result=storeServiceservice.changePrice(param);
	}
	
	@GetMapping("/reportManagement")
	public String reportList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage,Model m) {
		List<Report> reportList=service.reportList(Map.of("cPage", cPage, "numPerpage", numPerpage));
		int totalData = service.reportListCount();
		m.addAttribute("reportList", reportList);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "reportList","fn_paging"));
		return "admin/reportManagement";
	}
	@GetMapping("/matchpredictionCmList")
	public String matchpredictionCmList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage,Model m) {
		List<Report> matchpredictionCmList=service.matchpredictionCmList(Map.of("cPage", cPage, "numPerpage", numPerpage));
		int totalData = service.matchpredictionCmListCount();
		m.addAttribute("reportList", matchpredictionCmList);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "reportList","fn_paging"));
		return "admin/reportManagement";
	}
	@GetMapping("/reportRemove")
	public String reportRemove(Model m,@RequestParam("reportNo") String reportNo,@RequestParam("cmBoardNo") String cmBoardNo) {
		int reportRemove=service.reportRemove(reportNo);
		communityService.boardRemove(cmBoardNo);
		if (reportRemove > 0) {
			m.addAttribute("msg", "게시글삭제 완료");
			m.addAttribute("loc", "/admin/reportManagement");
		} else {
			m.addAttribute("msg", "게시글삭제 실패");
			m.addAttribute("loc", "/admin/reportManagement");
		}
		return "common/msg";
	}

	
	@GetMapping("/reportCmList")
	public String reportCmList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage,Model m) {
		List<Report> reportCmList=service.reportCmList(Map.of("cPage", cPage, "numPerpage", numPerpage));
		int totalData = service.reportCmListCount();
		System.out.println(reportCmList);
		m.addAttribute("reportList", reportCmList);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "reportCmList","fn_paging"));
		return "admin/reportManagement";
	}
	@GetMapping("/reportCmRemove")
	public String reportCmRemove(Model m,@RequestParam("reportNo") String reportNo,@RequestParam("cmCommentNo") String cmCommentNo) {
		int reportRemove=service.reportRemove(reportNo);
		communityService.cmRemoveBtn(Map.of("commentNo", cmCommentNo));
		
		if (reportRemove > 0) {
			m.addAttribute("msg", "댓글삭제 완료");
			m.addAttribute("loc", "/admin/reportCmList");
		} else {
			m.addAttribute("msg", "댓글삭제 실패");
			m.addAttribute("loc", "/admin/reportCmList");
		}
		return "common/msg";
	}
	
	@GetMapping("/reportMpRemove")
	public String reportMpRemove(Model m,@RequestParam("reportNo") String reportNo,@RequestParam("mpCommentNo") String mpcNo) {
		System.out.println(mpcNo);
		int reportRemove=service.reportRemove(reportNo);
		mathchService.deleteComment(mpcNo);
		if (reportRemove > 0) {
			m.addAttribute("msg", "댓글삭제 완료");
			m.addAttribute("loc", "/admin/matchpredictionCmList");
		} else {
			m.addAttribute("msg", "댓글삭제 실패");
			m.addAttribute("loc", "/admin/matchpredictionCmList");
		}
		return "common/msg";
	}
	

	
	

	
}
