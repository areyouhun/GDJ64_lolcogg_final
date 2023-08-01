package gg.lolco.model.dao;

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
	public Map<String, Object> selectPlayerByNickname(SqlSession session, String nickname) {
		return session.selectOne("teamdata.selectPlayerByNickname", nickname);
	}

}
