package gg.lolco.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import gg.lolco.common.PageFactory;
import gg.lolco.model.service.QnaService;
import gg.lolco.model.vo.QaBoard;
import gg.lolco.model.vo.QaBoardComment;
import gg.lolco.model.vo.QaBoardFile;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/qna")
@Slf4j
public class QnaController {
	
	private QnaService service;
	
	public QnaController(QnaService service) {
		this.service = service;
	}
	
//	qna 목록 조회
	@RequestMapping("/qnaList")
	public String qnaList(@RequestParam(value = "cPage", defaultValue = "1") int cPage, @RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, Model m) {
		List<QaBoard> qb = service.selectQnaListAll(Map.of("cPage", cPage, "numPerpage", numPerpage));
		int totalData = service.selectQnaListCount();
		
		m.addAttribute("qb", qb);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "qnaList"));
		
		return "qna/qnaList";
	}
	
//	qna 글, 댓글 조회
	@RequestMapping("/qnaView")
	public String qnaView(Model m, int no) {
		QaBoard qb = service.qnaView(no);
		List<QaBoardComment> qbc = service.selectCommentAll(no);

		m.addAttribute("qb", qb);
		m.addAttribute("qbc", qbc);
		return "qna/qnaView";
	}
	
//	qna 삭제
	@RequestMapping("/deleteQna")
	public String deleteQna(int no, Model m) {
		int result = service.deleteQna(no);
		
		String loc = "/qna/qnaList";
		m.addAttribute("loc", loc);
		if(result > 0) m.addAttribute("msg", "문의글 삭제 완료");
		else m.addAttribute("msg", "문의글 삭제 실패");
		
		return "common/msg";
	}
	
//	qna 댓글 등록
	@PostMapping("/insertComment")
	@ResponseBody
	public List<QaBoardComment> insertComment(@RequestParam Map param) {
		int qaNo = Integer.parseInt((String.valueOf(param.get("qaNo"))));
		
		// 댓글 등록
		int result = service.insertComment(param);
		
		if(result > 0) {
			// 성공 -> 댓글목록 가져와 리턴
			List<QaBoardComment> qbc = service.selectCommentAll(qaNo);
			return qbc;
		} else {
			return null;
		}
	}

}
