package gg.lolco.controller;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import gg.lolco.common.PageFactory;
import gg.lolco.model.service.NoticeService;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.Notice;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice")
@Slf4j
public class NoticeController {
	
	private NoticeService service;
	
	public NoticeController(NoticeService service) {
		this.service = service;
	}
	
	@RequestMapping("/selectNotice")
	public String selectNotice(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, Model m) { 
		List<Notice> selectNotice = service
				.selectNotice(Map.of("cPage", cPage, "numPerpage", numPerpage));
		
		int totalData = service.selectNoticeCount();
		m.addAttribute("selectNotice", selectNotice);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "selectNotice","fn_paging"));
		return "notice/noticeList";
	}
	@PostMapping("/insertNoticeEnd")
	public String insertNotice(@RequestParam("boardCategories") String boardCategories,
			@RequestParam("content1") String content, @RequestParam("title") String title,
			@SessionAttribute("loginMember") Member member, HttpSession session,
			Model m) { 
		String email = member.getEmail();
		int insertNotice = service.insertNotice(Map.of("boardCategories", boardCategories, "title", title,
				 "content", content, "email", email));
		if (insertNotice > 0) {
			m.addAttribute("msg", "게시글작성 완료");
			m.addAttribute("loc", "/notice/selectNotice");
		} else {
			m.addAttribute("msg", "게시글작성 실패");
			m.addAttribute("loc", "/notice/selectNotice");
		}
		return "common/msg";
	}
	@RequestMapping("/selectCategorie")
	public String selectCategorie(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, Model m,@RequestParam("categorie") int categorie ) { 
		List<Notice> selectCategorie = service.selectCategorie(Map.of("cPage", cPage, "numPerpage", numPerpage,"categorie", categorie));
		m.addAttribute("selectNotice", selectCategorie);
		return "notice/noticeList";
	}
	@RequestMapping("/noticeDetails")
	public String noticeDetails(Model m,@RequestParam("noticeNo") int noticeNo ) { 
		Notice noticeDetails = service.noticeDetails(Map.of("noticeNo", noticeNo));
		m.addAttribute("noticeDetails", noticeDetails);
		return "notice/noticeDetails";
	}
	@RequestMapping("/noticeModify")
	public String noticeModify(Model m,@RequestParam("noticeNo") int noticeNo ) { 
		Notice noticeModify = service.noticeDetails(Map.of("noticeNo", noticeNo));
		m.addAttribute("noticeModify", noticeModify);
		return "notice/noticeModify";
	}
	@PostMapping("/updateNotice")
	public String updateNotice(@RequestParam("boardCategories") String boardCategories,
			@RequestParam("content1") String content, @RequestParam("title") String title,
			 HttpSession session, @RequestParam("boardNo") int boardNo, Model m) {
			
		int updateNotice = service.updateNotice(Map.of("boardCategories", boardCategories, "title", title, 
				"content", content, "boardNo", boardNo));
		if (updateNotice > 0) {
			m.addAttribute("msg", "게시글수정 완료");
			m.addAttribute("loc", "/notice/selectNotice");
		} else {
			m.addAttribute("msg", "게시글수정 실패");
			m.addAttribute("loc", "/notice/selectNotice");
		}
		return "common/msg";
	}
	@GetMapping("/noticrRemove")
	public String noticrRemove(@RequestParam("boardNo") String boardNo, Model m) {
		int noticrRemove = service.noticrRemove(boardNo);
		if (noticrRemove > 0) {
			m.addAttribute("msg", "게시글삭제 성공");
			m.addAttribute("loc", "/notice/selectNotice");
		} else {
			m.addAttribute("msg", "게시글삭제 실패");
			m.addAttribute("loc", "/notice/selectNotice");
		}
		return "common/msg";
	}
}
