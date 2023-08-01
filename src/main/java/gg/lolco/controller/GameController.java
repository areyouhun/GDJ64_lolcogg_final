package gg.lolco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/game")
@Slf4j
public class GameController {
	
	@GetMapping("/choice")
	public String storeMain(Model m) {
		return "game/choicGame";
	}
	@GetMapping("/worldcup")
	public String worldcupMain(Model m,String gameName) {
		m.addAttribute("gameName",gameName);
		return "game/worldCup";
	}
}
