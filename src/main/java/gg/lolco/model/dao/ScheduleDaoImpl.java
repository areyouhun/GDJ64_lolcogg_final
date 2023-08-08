package gg.lolco.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {
	
	@Override
	public int updatePlayerFile(SqlSession session, Map<String, String> param) {
		return session.update("schedule.updatePlayerFile", param);
	}

	@Override
	public int updateMatchFile(SqlSession session, Map<String, String> param) {
		return session.update("schedule.updateMatchFile", param);
	}
	
	@Override
	public int updateTeamRanking(SqlSession session, Map<String, String> param) {
		return session.update("schedule.updateTeamRanking", param);
	}
	
	@Override
	public int updateRegionalMatch(SqlSession session, Map<String, String> param) {
		return session.update("schedule.updateRegionalMatch", param);
	}
	
	@Override
	public int updateMatchTeam(SqlSession session, Map<String, String> param) {
		return session.update("schedule.updateMatchTeam", param);
	}

}
