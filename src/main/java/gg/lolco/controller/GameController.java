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

import gg.lolco.common.PageFactory;
import gg.lolco.common.PageFactoryWorldCup;
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
	public String worldcupMain(Model m,String gameName,int num) {
		m.addAttribute("count",service.worldAllCount(num));
		m.addAttribute("num",num);
		m.addAttribute("gameName",gameName);
		return "game/worldCup";
	}
	@GetMapping("/worldcupRanking")
	public String worldcupRanking(@RequestParam(value="cPage", defaultValue="1") int cPage,@RequestParam(value="numPerpage",defaultValue="5") int numPerpage, Model m,String gameName,int num) {
		List<WCImg> WCR=service.selectWCImgAll(Map.of("cPage",cPage, "numPerpage", numPerpage,"num",num));
		m.addAttribute("rate",service.worldRate(num));
		m.addAttribute("rateOTO",service.worldRateOTO(num));
		m.addAttribute("WCR",WCR);
		m.addAttribute("pageBar", PageFactoryWorldCup.getPage(cPage, numPerpage, service.worldAllCount(num), "worldcupRanking",gameName,num));
		m.addAttribute("gameName",gameName);
		return "game/worldcupRanking";
	}
	
//	@GetMapping("/worldcupRank")
//	public String worldcupRank(@RequestParam(value="cPage", defaultValue="1") int cPage,@RequestParam(value="numPerpage",defaultValue="5") int numPerpage, Model m,String gameName,int num) {
//		List<WCImg> WCR=service.selectWCImgAll(Map.of("cPage",cPage, "numPerpage", numPerpage,"num",num));
//		m.addAttribute("rate",service.worldRate(num));
//		m.addAttribute("ranking",0);
//		m.addAttribute("WCR",WCR);
//		m.addAttribute("pageBar", PageFactoryWorldCup.getPage(cPage, numPerpage, service.worldAllCount(num), "worldcupRanking?num="+num));
//		m.addAttribute("gameName",gameName);
//		return "game/worldcupRanking";
//	}
	
	@GetMapping("/worldcupStart")
	@ResponseBody
	public List<WCImg> worldcupStart(Model m,String num,String round) {
		Map<String,Object> param=new HashMap<>();
		param.put("num", num);
		param.put("round", round);
		return service.worldcupStart(param);
	}
	
	@PostMapping("/winnerwinnerChickemDinner")
	@ResponseBody
	public void winnerwinnerChickemDinner(Model m,String name) {
		service.winnerwinnerChickemDinner(name);
	}
	
	@PostMapping("/OTOWinner")
	@ResponseBody
	public void OTOWinner(Model m,String name) {
		service.OTOWinner(name);
	}
	
	
}
