package gg.lolco.controller;

import java.util.HashMap;
import java.util.List;
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
import gg.lolco.model.vo.CardPack;
import gg.lolco.model.vo.EmoPack;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberEmoticon;
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
	public String storeMain(Model m,@SessionAttribute(name="loginMember", required = false) Member member) {
		m.addAttribute("mostItems",service.selectMostItem());
		m.addAttribute("itemsEmoticon",service.selectItemMain(2));
		m.addAttribute("itemsCard",service.selectItemMain(1));
		m.addAttribute("itemsETC",service.selectItemMain(3));
		if(member!=null) {
			Map<String,Object> param=new HashMap<>();
			String email=member.getEmail();
			param.put("email", email);
			m.addAttribute("buyer",serviceMember.selectMemberById(param));
		}
		return "store/storeMain";
	}
	
	@GetMapping("/detail")
	public String storeDetail(Model m,Integer no,String name,@SessionAttribute(name="loginMember", required = false) Member member,String sort, String order) {
		Map<String,Object> param=new HashMap<>();
		if(member!=null) {
			String email=member.getEmail();
			param.put("email", email);
			m.addAttribute("buyer",serviceMember.selectMemberById(param));
		}
		if(name==null){
			 name="";
		}
		param.put("no", no);
		param.put("sort", sort);
		param.put("order", order);
		param.put("itemname","%"+name+"%");
		m.addAttribute("items",service.selectItemDetail(param));
		m.addAttribute("no",no);
		m.addAttribute("sort",sort);
		m.addAttribute("order",order);
		return "store/storeDetail";
	}
	
	@RequestMapping("/purchase")
	public String itemPurchase(Model m,String name,@SessionAttribute("loginMember") Member member,int price) {
		Map<String,Object> param=new HashMap<>();
		String email=member.getEmail();
		param.put("email", email);
		param.put("price", price);
		param.put("name", name);
		int result=service.buyerMoney(param);
		List<EmoPack> emopack= service.itemPurchaseEmoticon(name);
		List<CardPack> cardPack=service.itemPurchaseCard(name);
		int puchaseResult=service.itemPurchase(param);
		if(puchaseResult>0&&result>0) {
			if(!(cardPack.size()==0)){
				for(CardPack c:cardPack) {
					param.put("cardNo", c.getCard().getCardNo());
					service.memberCardBuy(param);
				};
			}
			if(!(emopack.size()==0)){
				for(EmoPack e:emopack) {
					param.put("emoNo", e.getEmoNo().getEmoNo());
					MemberEmoticon me=service.memberEmoticonCheck(param);
					if(me==null) {
						service.memberEmoticonBuy(param);
					}else {
						param.put("price", -(price/5)*0.8);
						service.buyerMoney(param);
					}

				};
			}
			m.addAttribute("emopack",emopack);
			m.addAttribute("cardPack",cardPack);
		}
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
	
	@RequestMapping("/nickChange")
	@ResponseBody
	public void nickChange(Model m,String name,@SessionAttribute("loginMember") Member member,SessionStatus status,  HttpSession session,int price){
		String email=member.getEmail();
		Map<String,Object> param=new HashMap<>();
		param.put("email", email);
		param.put("changename", name);
		param.put("price", price);
		param.put("name", "닉네임 변경권");
		int result=service.buyerMoney(param);
		int resultChange=service.nickChange(param);
		int puchaseResult=service.itemPurchase(param);
		if(resultChange>0&&result>0) {
			Member memberupdate=serviceMember.selectMemberById(param);
			if(!status.isComplete()) status.setComplete();
			session.setAttribute("loginMember", memberupdate);
		}
	}
	
	@RequestMapping("addExp")
	@ResponseBody
	public void addExp(@SessionAttribute("loginMember") Member member, int exp,SessionStatus status,  HttpSession session,int price,String name) {
		String email=member.getEmail();
		int memberExp=member.getTotalExp();
		Map<String,Object> param=new HashMap<>();
		param.put("email", email);
		param.put("price", price);
		param.put("name", name);
		int result=service.buyerMoney(param);
		int puchaseResult=service.itemPurchase(param);
		if(memberExp+exp<0) {
			exp=-memberExp;
		}
		param.put("exp", exp);
		int resultExp=service.addExp(param);
		if(result>0&&resultExp>0) {
			Member memberupdate=serviceMember.selectMemberById(param);
			if(!status.isComplete()) status.setComplete();
			session.setAttribute("loginMember", memberupdate);
		}
	}
	
	
	
}
