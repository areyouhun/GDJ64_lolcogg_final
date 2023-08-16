package gg.lolco.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.lolco.model.service.MemberService;
import gg.lolco.model.service.StoreService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private StoreService service;
	
	public AdminController( StoreService service) {
		this.service=service;
	}
	
	@GetMapping("/memberManagement")
	public String memberManagement(Model model) {
		// SANGJUN
		return "/admin/memberManagement";
	}
	
	@GetMapping("/storeManagement")
	public String storeManagement(Model model) {
		// JOONHO
		model.addAttribute("saleListAll",service.saleListAll(0));
		model.addAttribute("saleListOne",service.saleListAll(1));
		model.addAttribute("saleListWeek",service.saleListAll(7));
		return "/admin/storeManagement";
	}
	
	@PostMapping("/changePrice")
	@ResponseBody
	public void changePrice(int price,int itemNo) {
		Map<String,Object> param=new HashMap<>();
		param.put("price", price);
		param.put("itemNo", itemNo);
		int result=service.changePrice(param);
	}
	
	@GetMapping("/reportManagement")
	public String reportManagement(Model model) {
		// INHO
		return "/admin/reportManagement";
	}
}
