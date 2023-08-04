package gg.lolco.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.Team;

public interface MainPageDao {
	
	List<MatchSchedule> todayMs(SqlSessionTemplate session);
	
	List<Team> teamRank(SqlSessionTemplate session);
}
