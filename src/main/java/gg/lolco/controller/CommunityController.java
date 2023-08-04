package gg.lolco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import gg.lolco.common.PageFactory;
import gg.lolco.model.service.CommunityService;
import gg.lolco.model.vo.Card;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberCard;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/community")
@SessionAttributes({ "loginMember" })
@Slf4j
public class CommunityController {

	private final CommunityService service;

	public CommunityController(CommunityService service) {
		this.service = service;
	}

	/*
	 * @RequestMapping("/selectboardList") public String
	 * selectboardList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
	 * 
	 * @RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage,
	 * 
	 * @SessionAttribute("loginMember") Member member, Model m) { String email =
	 * member.getEmail(); List<CommunityBoard> selectboardList = service
	 * .selectCardById(Map.of("cPage", cPage, "numPerpage", numPerpage, "email",
	 * email)); MemberCard selectLeaderCard = service.selectLeaderCard(email);
	 * List<Card> selectCardName = service.selectCardName(); int totalData =
	 * service.selectCardCountById(email); m.addAttribute("pageBar",
	 * PageFactory.getPage(cPage, numPerpage, totalData, "selectCardById"));
	 * m.addAttribute("selectCardName", selectCardName); m.addAttribute("cardList",
	 * selectCardById); System.out.println(selectLeaderCard); m.addAttribute("l",
	 * selectLeaderCard);
	 * 
	 * return "/card/Mycard"; }
	 */
}
