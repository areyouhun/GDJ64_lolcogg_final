package gg.lolco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gg.lolco.model.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	private StoreService service;
	
	public StoreController( StoreService service) {
		this.service=service;
	}
	
	@GetMapping("/main")
	public String storeMain(Model m) {
		m.addAttribute("items",service.selectItem());
		return "store/storeMain";
	}
	
	@GetMapping("/purchase")
	public String itemPurchase() {
		return "store/storePurchase";
	}
	@GetMapping("/playerPack")
	public String playerPack() {
		return "store/storeDetail";
	}
}
