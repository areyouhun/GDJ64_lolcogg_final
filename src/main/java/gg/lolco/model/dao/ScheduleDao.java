package gg.lolco.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface ScheduleDao {
	
	int updatePlayerFile(SqlSession session, Map<String, String> param);
	
	int updateMatchFile(SqlSession session, Map<String, String> param);
	
	int updateTeamRanking(SqlSession session, Map<String, String> param);
	
	int updateRegionalMatch(SqlSession session, Map<String, String> param);
	
	int updateMatchTeam(SqlSession session, Map<String, String> param);
	
}
