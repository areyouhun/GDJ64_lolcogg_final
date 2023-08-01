package gg.lolco.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface TeamDataDao {

	Map<String, Object> selectTeamByAbbr(SqlSession session, String abbr);
	
	Map<String, Object> selectPlayerByNickname(SqlSession session, String nickname);
}