package gg.lolco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainPageController {
	
	@GetMapping("/mainPage")
	public String index(Model m) {
		
		
		return "index";
	}
}
