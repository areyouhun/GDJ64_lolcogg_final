package gg.lolco.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;

import gg.lolco.model.service.MemberService;
import gg.lolco.model.service.StoreService;
import gg.lolco.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/store")
@Slf4j
public class StoreController {
	
	private StoreService service;
	private MemberService serviceMember;
	
	public StoreController( StoreService service,MemberService serviceMember) {
		this.service=service;
		this.serviceMember=serviceMember;
	}
	
	@GetMapping("/main")
	public String storeMain(Model m) {
		m.addAttribute("itemsEmoticon",service.selectItemMain(2));
		m.addAttribute("itemsCard",service.selectItemMain(1));
		m.addAttribute("itemsETC",service.selectItemMain(3));
		return "store/storeMain";
	}
	
	@GetMapping("/detail")
	public String storeDetail(Model m,Integer no,String name) {
		Map<String,Object> param=new HashMap<>();
		System.out.println(no);
		param.put("no", no);
		param.put("itemname","%"+name+"%");
		m.addAttribute("items",service.selectItemDetail(param));
		m.addAttribute("no",no);
		return "store/storeDetail";
	}
	
	@GetMapping("/purchase")
	public String itemPurchase(Model m,String name) {
		m.addAttribute("emopack",service.itemPurchaseEmoticon(name));
		m.addAttribute("cardPack",service.itemPurchaseCard(name));
		return "store/storePurchase";
	}
	
	@GetMapping("/playerPack")
	public String playerPack() {
		return "store/storeDetail";
	}
	
	@GetMapping("/nickCkeck")
	@ResponseBody
	public String nickCkeck(Model m,String name){
		return service.nickCkeck(name);
	}
	
	@PostMapping("/nickChange")
	@ResponseBody
	public void nickChange(Model m,String name,@SessionAttribute("loginMember") Member member,SessionStatus status,  HttpSession session){
		String email=member.getEmail();
		Map<String,Object> param=new HashMap<>();
		param.put("email", email);
		service.nickChange(Map.of("name",name,"email",email));
		Member memberupdate=serviceMember.selectMemberById(param);
		if(!status.isComplete()) status.setComplete();
		session.setAttribute("loginMember", memberupdate);
	}
}
