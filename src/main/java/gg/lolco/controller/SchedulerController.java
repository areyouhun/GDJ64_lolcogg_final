package gg.lolco.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;

import gg.lolco.model.service.SchedulerService;

@Controller
public class SchedulerController {

	private final SchedulerService service;
	
	public SchedulerController(SchedulerService service) {
		this.service = service;
	}

	public String updatePlayerFile(List<Map<String, String>> param) {
		return service.updatePlayerFile(param) > 0 ? "선수 정보 업데이트" : "선수 정보 업데이트 실패";
	}
	
	public String updateMatchFile(List<Map<String, String>> param) {
		return service.updateMatchFile(param) > 0 ? "경기 결과 업데이트" : "경기 결과 업데이트 실패";
	}
	
}
