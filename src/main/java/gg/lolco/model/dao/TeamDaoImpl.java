package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TeamDaoImpl implements TeamDataDao {

	@Override
	public Map<String, Object> selectTeamByAbbr(SqlSession session, String abbr) {
		return session.selectOne("teamdata.selectTeamByAbbr", abbr);
	}
	
	@Override
	public List<Map<String, Object>> selectMatchScheduleByAbbr(SqlSession session, String abbr) {
		return session.selectList("teamdata.selectMatchScheduleByAbbr", abbr);
	}

	@Override
	public List<Map<String, Object>> selectMatchHistoryByAbbr(SqlSession session, String abbr) {
		return session.selectList("teamdata.selectMatchHistoryByAbbr", abbr);
	}

	@Override
	public Map<String, Object> selectPlayerByNickname(SqlSession session, String nickname) {
		return session.selectOne("teamdata.selectPlayerByNickname", nickname);
	}

}
