package gg.lolco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import gg.lolco.model.service.CardService;
import gg.lolco.model.service.StoreService;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberCard;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/store")
@Slf4j
public class StoreController {
	
	private StoreService service;
	
	public StoreController( StoreService service) {
		this.service=service;
	}
	
	@GetMapping("/main")
	public String storeMain(Model m) {
		m.addAttribute("itemsEmoticon",service.selectItemMain(2));
		m.addAttribute("itemsCard",service.selectItemMain(1));
		m.addAttribute("itemsETC",service.selectItemMain(3));
		return "store/storeMain";
	}
	
	@GetMapping("/detail")
	public String storeDetail(Model m,int no) {
		m.addAttribute("items",service.selectItemDetail(no));
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
}
