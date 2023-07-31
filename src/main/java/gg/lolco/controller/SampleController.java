package gg.lolco.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gg.lolco.model.service.SampleService;

@Controller
public class SampleController {
	private final SampleService service;
	
	public SampleController(SampleService service) {
		this.service = service;
	}
	
	@GetMapping("/sampleAll")
	public String selectAll(Model model) {
		model.addAttribute("sample", service.selectAll());
		return "sample/sampleList";
	}

}
