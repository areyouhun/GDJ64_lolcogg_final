package gg.lolco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("/memberManagement")
	public String memberManagement(Model model) {
		// SANGJUN
		return "/admin/memberManagement";
	}
	
	@GetMapping("/storeManagement")
	public String storeManagement(Model model) {
		// JUNHO
		return "/admin/storeManagement";
	}
	
	@GetMapping("/reportManagement")
	public String reportManagement(Model model) {
		// INHO
		return "/admin/reportManagement";
	}
}
