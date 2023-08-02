package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface TeamDataDao {

	Map<String, Object> selectTeamByAbbr(SqlSession session, String abbr);
	
	List<Map<String, Object>> selectMatchScheduleByAbbr(SqlSession session, String abbr);
	
	List<Map<String, Object>> selectMatchHistoryByAbbr(SqlSession session, String abbr);
	
	Map<String, Object> selectPlayerByNickname(SqlSession session, String nickname);
	
	Map<String, Object> selectMatchResultByKeyword(SqlSession session, Map<String, String> keyword);
}
