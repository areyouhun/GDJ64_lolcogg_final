package gg.lolco.model.service;

import java.util.List;

import gg.lolco.model.vo.MatchPrediction;
import gg.lolco.model.vo.MatchSchedule;

public interface MatchPredictionService {
	
	int playerCount();
	
	int nowWeek();
	
	List<MatchSchedule> week();
	
	List<MatchSchedule> matchScheduleByWeek(int week);
	
	List<MatchPrediction> matchMpYn();
	
	int updateMpYn();
	
	List<MatchPrediction> mpSuccess(String nickname);
}
