package gg.lolco.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.lolco.model.service.QuizService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/quiz")
public class QuizController {
	
	private QuizService service;

	public QuizController(QuizService service) {
		this.service = service;
	}
	
	@RequestMapping("/soundQuiz")
	public String soundQuiz() {
		return "quiz/soundQuiz";
	}
	
	@RequestMapping("/finish")
	@ResponseBody
	public void finishQuiz(@RequestParam Map param) {
		log.info("@@@@@{}", param);
		int result = service.finishQuiz(param);
	}
	
	@RequestMapping("/basicQuiz")
	public String basicQuiz() {
		return "quiz/basicQuiz";
	}
}
