package gg.lolco.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import gg.lolco.model.vo.MatchPrediction;
import gg.lolco.model.vo.MatchSchedule;

public interface MatchPredictionDao {
	
	int playerCount(SqlSessionTemplate session);
	
	int nowWeek(SqlSessionTemplate session);
	
	List<MatchSchedule> week(SqlSessionTemplate session);
	
	List<MatchSchedule> matchScheduleByWeek(SqlSessionTemplate session, int week);
	
	List<MatchPrediction> matchMpYn(SqlSessionTemplate session);
	
	int updateMpYn(SqlSessionTemplate session);
}
