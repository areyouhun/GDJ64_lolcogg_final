package gg.lolco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gg.lolco.common.PageFactory;
import gg.lolco.model.service.QnaService;
import gg.lolco.model.vo.QaBoard;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/qna")
@Slf4j
public class QnaController {
	
	private QnaService service;
	
	public QnaController(QnaService service) {
		this.service = service;
	}
	
	@RequestMapping("/qnaList")
	public String qnaList(@RequestParam(value = "cPage", defaultValue = "1") int cPage, @RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, Model m) {
		List<QaBoard> qb = service.selectQnaListAll(Map.of("cPage", cPage, "numPerpage", numPerpage));
		int totalData = service.selectQnaListCount();
		
		m.addAttribute("qb", qb);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "qnaList"));
		
		return "qna/qnaList";
	}
	
}
