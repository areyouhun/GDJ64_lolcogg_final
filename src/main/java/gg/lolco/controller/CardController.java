package gg.lolco.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import gg.lolco.common.PageFactory;
import gg.lolco.model.service.CardService;
import gg.lolco.model.vo.Card;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberCard;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/card")
@SessionAttributes({"loginMember"})
@Slf4j
public class CardController {
	
	private final CardService service;
	
	public CardController(CardService service) {
		this.service = service;
	}
	@RequestMapping("/selectCardById")
	public String selectCardById(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "12") int numPerpage,@SessionAttribute("loginMember") Member member,Model m) {
		String email=member.getEmail();
		List<MemberCard> selectCardById=service.selectCardById(Map.of("cPage", cPage, "numPerpage", numPerpage,"email",email));
		List<Card> selectCardName=service.selectCardName();
		int totalData = service.selectCardCountById(email);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "selectCardById"));
		m.addAttribute("selectCardName",selectCardName);
		m.addAttribute("cardList",selectCardById);
			
		return "/card/Mycard";
	}
	@GetMapping("/selectCategorie")
	@ResponseBody
	public List<MemberCard> selectCategorie(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
            @RequestParam(value = "numPerpage", defaultValue = "12") int numPerpage,
            @SessionAttribute("loginMember") Member member,
            @RequestParam("rating") String ratingVal,
            @RequestParam("team") String teamVal,
            @RequestParam("player") String playerVal,
            @RequestParam("season") String seasonVal,
            @RequestParam("position") String positionVal,
            Model m) {
		String email=member.getEmail();
		  Map<String, Object> params = new HashMap<>();
		    params.put("cPage", cPage);
		    params.put("numPerpage", numPerpage);
		    params.put("email", email);
		    params.put("rating", ratingVal);
		    params.put("team", teamVal);
		    params.put("player", playerVal);
		    params.put("season", seasonVal);
		    params.put("position", positionVal);
		List<MemberCard> selectCategorie = service.selectCategorie(params);
		int totalData = selectCategorie.size();

		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "selectCategorie"));
		return selectCategorie;
		
	
	}
	@GetMapping("/searchPlayer")
	@ResponseBody
	public List<MemberCard> searchPlayer(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
            @RequestParam(value = "numPerpage", defaultValue = "12") int numPerpage,
            @SessionAttribute("loginMember") Member member,
            @RequestParam("search") String search,
            Model m) {
		String email=member.getEmail();
		  Map<String, Object> params = new HashMap<>();
		    params.put("cPage", cPage);
		    params.put("numPerpage", numPerpage);
		    params.put("email", email);
		    params.put("search", search);		  
		List<MemberCard> searchPlayer = service.searchPlayer(params);
		int totalData = searchPlayer.size();

		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "searchPlayer"));
		return searchPlayer;
		
	}
	
}
