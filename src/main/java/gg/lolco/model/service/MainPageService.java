package gg.lolco.model.service;

import java.util.List;

import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.Team;

public interface MainPageService {
	
	List<MatchSchedule> todayMs();
	
	List<Team> teamRank();
}
