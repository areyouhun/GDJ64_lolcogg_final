package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.MatchSchedule;

public interface CalendarService {
	
	List<MatchSchedule> selectByMatchSchedule(Map<String, String> param);
	
}
