package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface ChampPredictDao {
	
	List<Map<String, Object>> selectMatchDate(SqlSession session);
	
	int insertChampPredict(SqlSession session, Map<String, String> param);
	
	int insertBanpickPredict(SqlSession session, Map<String, String> param);
	
	List<Map<String, Object>> selectMatchData(SqlSession session);
	
	List<String> selectMemberPredict(SqlSession session, int no);
	
	List<Integer> selectYesterDayPredict(SqlSession session);
	
	int updateMemberScore(SqlSession session, Map<String, Object> param);
	
	int updatePlayYn(SqlSession session, String email);
	
	String selectPredictYn(SqlSession session, String email);
	
	int updateMemberPoiont(SqlSession session);
	
	int insertPointHistory(SqlSession session, int no);
	
}
