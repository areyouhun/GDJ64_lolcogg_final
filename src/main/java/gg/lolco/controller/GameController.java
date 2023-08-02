package gg.lolco.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.lolco.model.service.GameService;
import gg.lolco.model.vo.WCImg;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/game")
@Slf4j
public class GameController {
	
	private GameService service;
	
	public GameController(GameService service) {
		this.service=service;
	}
	
	@GetMapping("/choice")
	public String storeMain(Model m) {
		return "game/choicGame";
	}
	@GetMapping("/worldcup")
	public String worldcupMain(Model m,String gameName,int no) {
		m.addAttribute("count",service.worldAllCount(no));
		m.addAttribute("no",no);
		m.addAttribute("gameName",gameName);
		return "game/worldCup";
	}
	
	@GetMapping("/worldcupStart")
	@ResponseBody
	public List<WCImg> worldcupStart(Model m,String no,String round) {
		Map<String,Object> param=new HashMap<>();
		param.put("no", no);
		param.put("round", round);
		return service.worldcupStart(param);
	}
}
