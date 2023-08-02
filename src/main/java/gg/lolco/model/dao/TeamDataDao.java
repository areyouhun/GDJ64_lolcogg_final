package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface TeamDataDao {

	Map<String, Object> selectTeamByAbbr(SqlSession session, String abbr);
	
	List<Map<String, Object>> selectMatchByAbbr(SqlSession session, String abbr);
	
	Map<String, Object> selectPlayerByNickname(SqlSession session, String nickname);
}
