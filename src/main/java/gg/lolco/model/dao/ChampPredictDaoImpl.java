package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ChampPredictDaoImpl implements ChampPredictDao {

	@Override
	public List<Map<String, Object>> selectMatchDate(SqlSession session) {
		return session.selectList("champ_predict.selectMatchDate");
	}

	@Override
	public int insertChampPredict(SqlSession session, Map<String, String> param) {
		return session.insert("champ_predict.insertChampPredict", param);
	}
	
	@Override
	public int insertBanpickPredict(SqlSession session, Map<String, String> param) {
		return session.insert("champ_predict.insertBanpickPredict", param);
	}
	
	@Override
	public List<Map<String, Object>> selectMatchData(SqlSession session) {
		return session.selectList("champ_predict.selectMatchData");
	}
	
	@Override
	public List<String> selectMemberPredict(SqlSession session, int no) {
		return session.selectList("champ_predict.selectMemberPredict", no);
	}
	
	@Override
	public List<Integer> selectYesterDayPredict(SqlSession session) {
		return session.selectList("champ_predict.selectYesterDayPredict");
	}
	
	@Override
	public int updateMemberScore(SqlSession session, Map<String, Object> param) {
		return session.update("champ_predict.updateMemberScore", param);
	}
	
	@Override
	public int updatePlayYn(SqlSession session, String email) {
		return session.update("champ_predict.updatePlayYn", email);
	}
	
	@Override
	public String selectPredictYn(SqlSession session, String email) {
		return session.selectOne("champ_predict.selectPredictYn", email);
	}
	
	@Override
	public int updateMemberPoiont(SqlSession session) {
		return session.update("champ_predict.updateMemberPoiont");
	}
	
	@Override
	public int insertPointHistory(SqlSession session, int no) {
		return session.insert("champ_predict.insertPointHistory", no);
	}
	
}
