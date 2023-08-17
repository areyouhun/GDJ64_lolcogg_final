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
import gg.lolco.model.vo.CardAchievementComplete;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberCard;
import gg.lolco.model.vo.MemberCardAchievement;
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
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "selectCardById","fn_paging"));
		m.addAttribute("selectCardName",selectCardName);
		m.addAttribute("cardList",selectCardById);
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
	public Map<String,Object> selectCategorie(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
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
		int totalData = service.selectCategorieCount(params);

		Map<String,Object> result=new HashMap<>();

		String pageBar=PageFactory.getPage(cPage, numPerpage, totalData,"", "ajaxPaging");
		
		result.put("selectCategorie", selectCategorie);
		result.put("pageBar", pageBar);
		return result;
	}
	

	
	@GetMapping("/searchPlayer")
	@ResponseBody
	public Map<String,Object> searchPlayer(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
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
		int totalData = service.searchPlayerCount(params);
		Map<String,Object> result=new HashMap<>();
		String pageBar=PageFactory.getPage(cPage, numPerpage, totalData,"", "searchPaging");
		result.put("searchPlayer", searchPlayer);
		result.put("pageBar", pageBar);
		return result;

		
	}
	@RequestMapping("/cardAchievement")
	public String cardAchievement(@SessionAttribute("loginMember") Member member,Model m) {
		String email=member.getEmail();
		List<CardAchievementComplete> cardAchievement =service.cardAchievement(Map.of("email",email));
		List<MemberCard> selectCardById =service.selectCardById(Map.of("cPage", 1, "numPerpage", 500,"email",email));
		List<MemberCardAchievement>	selectMemberAchievement=service.selectMemberAchievement(Map.of("email",email));
		
			m.addAttribute("selectMemberAchievement",selectMemberAchievement);
			m.addAttribute("cardAchievement",cardAchievement);
			m.addAttribute("selectCardById",selectCardById);
	      return "card/cardAchievement";    
	}
	@RequestMapping("/achievementCompensation")
	public String achievementCompensation(@SessionAttribute("loginMember") Member member,Model m, 
			@RequestParam("compensation") String compensation,@RequestParam("ach") String ach) {
		String email=member.getEmail();
		service.insertCompensation(Map.of("compensation", compensation,"email",email));
			System.out.println(compensation);
			System.out.println(ach);
			int result=service.insertAchievementById(Map.of("ach", ach,"email",email));
			if(result>0) {		
				m.addAttribute("msg", "보상받기 완료");
				m.addAttribute("loc", "/card/cardAchievement");
				
			}else {
				m.addAttribute("msg", "보상받기 실패");
				m.addAttribute("loc", "/card/cardAchievement");
				
			}
		
	      return "common/msg";    
	}
	@GetMapping("/selectAchievement")
	public String selectAchievement(@SessionAttribute("loginMember") Member member,
            Model m) {
		String email=member.getEmail();
			  
		List<MemberCardAchievement>	selectMemberAchievement=service.selectMemberAchievement(Map.of("email",email));
		List<MemberCard> selectCardById =service.selectCardById(Map.of("cPage", 1, "numPerpage", 500,"email",email));
		List<CardAchievementComplete> cardAchievementAll =service.cardAchievementAll(Map.of("email",email));
		
		m.addAttribute("selectMemberAchievement",selectMemberAchievement);
		m.addAttribute("cardAchievement",cardAchievementAll);
		System.out.println(cardAchievementAll);
		m.addAttribute("selectCardById",selectCardById);
		return "card/cardAchievement";
		
	}
	@GetMapping("/achievementUnsatisfaction")
	public String achievementUnsatisfaction(@SessionAttribute("loginMember") Member member,
            Model m) {
		String email=member.getEmail();
		List<MemberCardAchievement>	selectMemberAchievement=service.selectMemberAchievement(Map.of("email",email));
		List<MemberCard> selectCardById =service.selectCardById(Map.of("cPage", 1, "numPerpage", 500,"email",email));
		List<CardAchievementComplete> achievementUnsatisfaction =service.achievementUnsatisfaction(Map.of("email",email));
		
		m.addAttribute("selectMemberAchievement",selectMemberAchievement);
		m.addAttribute("cardAchievement",achievementUnsatisfaction);
		m.addAttribute("selectCardById",selectCardById);
		return "card/cardAchievement";
		
	}
	@RequestMapping("/selectCard")
	public String selectCard(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "12") int numPerpage,Member member,Model m) {
		String email=member.getEmail();
		List<MemberCard> selectCard=service.selectCard(Map.of("cPage", cPage, "numPerpage", numPerpage));
		List<Card> selectCardName=service.selectCardName();
		int totalData = service.selectCardCount();
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "selectCard","fn_paging"));
		m.addAttribute("selectCardName",selectCardName);
		m.addAttribute("cardList",selectCard);
		return "/card/cardCatalog";
	}
	
	@GetMapping("/selectCategorieAll")
	@ResponseBody
	public Map<String,Object> selectCategorieAll(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
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
		List<Card> selectCategorieAll = service.selectCategorieAll(params);
		int totalData = service.selectCategorieAllCount(params);
		Map<String,Object> result=new HashMap<>();
		String pageBar=PageFactory.getPage(cPage, numPerpage, totalData, "","ajaxPaging");
		result.put("selectCategorieAll", selectCategorieAll);
		result.put("pageBar", pageBar);
		return result;
		
	
	}
	@GetMapping("/searchPlayerAll")
	@ResponseBody
	public Map<String,Object> searchPlayerAll(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
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
		List<Card> searchPlayerAll = service.searchPlayerAll(params);
		System.out.println(searchPlayerAll);
		int totalData = service.searchPlayerAllCount(params);
		Map<String,Object> result=new HashMap<>();
		String pageBar=PageFactory.getPage(cPage, numPerpage, totalData, "","searchPaging");
		result.put("searchPlayerAll", searchPlayerAll);
		result.put("pageBar", pageBar);
		return result;
		
	}
}
	
	
	
	
	
	

