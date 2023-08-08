package gg.lolco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.lolco.model.service.CalendarService;
import gg.lolco.model.vo.MatchSchedule;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/calendar")
@Slf4j
public class CalendarController {
	
	private CalendarService service;
	
	public CalendarController(CalendarService service) {
		this.service = service;
	}
	
	@GetMapping("/getAjaxCalendar")
	@ResponseBody
	public List<MatchSchedule> ajaxCalendar(@RequestParam String year, @RequestParam String month, Model model)
	{
		Map<String, String> param = Map.of("year", year, "month", month);
		return service.selectByMatchSchedule(param);
	}
}
