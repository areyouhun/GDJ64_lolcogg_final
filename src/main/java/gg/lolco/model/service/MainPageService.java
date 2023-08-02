package gg.lolco.model.service;

import java.util.List;

import gg.lolco.model.dao.MatchSchedule;

public interface MainPageService {
	
	List<MatchSchedule> todayMs();
}
