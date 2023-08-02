package gg.lolco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatchPerdictionController {

	@RequestMapping("/matchprediction")
	public String matchPrediction() {
		return "matchprediction/matchprediction";
	}
}
