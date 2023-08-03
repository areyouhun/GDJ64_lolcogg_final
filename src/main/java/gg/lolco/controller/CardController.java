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
		MemberCard selectLeaderCard=service.selectLeaderCard(email);
		List<Card> selectCardName=service.selectCardName();
		int totalData = service.selectCardCountById(email);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "selectCardById"));
		m.addAttribute("selectCardName",selectCardName);
		m.addAttribute("cardList",selectCardById);
		System.out.println(selectLeaderCard);
		m.addAttribute("l",selectLeaderCard);
			
		return "/card/Mycard";
	}
	@RequestMapping("/leaderSetting")
	public String leaderSetting(@SessionAttribute("loginMember") Member member, Model m) {
		String email=member.getEmail();
		List<MemberCard> selectCardById=service.selectCardById(Map.of("cPage", 1, "numPerpage", 100,"email",email));
		int totalData = service.selectCardCountById(email);
		m.addAttribute("cardList",selectCardById);
		m.addAttribute("totalData",totalData);
		return "/card/cardLeaderSetting";
		
	}
	@RequestMapping("/insertLeaderCaed")
	public String insertLeaderCaed(@SessionAttribute("loginMember") Member member,
			 @RequestParam("type") String type, Model m) {
		String email=member.getEmail();
		int insertLeaderCaed=service.insertLeaderCaed(type);	
		if(insertLeaderCaed>0) {		
			m.addAttribute("msg", "대표카드 설정완료");
			m.addAttribute("loc", "/card/leaderSetting");
			m.addAttribute("script", "window.close();opener.location.reload();");
		}else {
			m.addAttribute("msg", "대표카드 설정실패");
			m.addAttribute("loc", "/card/leaderSetting");
			m.addAttribute("script", "window.close();opener.location.reload();");
		}
	      return "common/msg";    
	}
	@RequestMapping("/leaderclear")
	public String leaderclear(@SessionAttribute("loginMember") Member member,
			 Model m) {
		String email=member.getEmail();
		int leaderclear=service.leaderclear();	
		if(leaderclear>0) {		
			m.addAttribute("msg", "대표카드 해제완료");
			m.addAttribute("loc", "/card/selectCardById");
			
		}else {
			m.addAttribute("msg", "대표카드 해제실패");
			m.addAttribute("loc", "/card/selectCardById");
			
		}
	      return "common/msg";    
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
