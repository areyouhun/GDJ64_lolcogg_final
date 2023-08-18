package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.ChampPredictDao;

@Service
public class ChampPredictServiceImpl implements ChampPredictService {
	
	private final ChampPredictDao dao;
	private final SqlSession session;
	
	public ChampPredictServiceImpl(ChampPredictDao dao, SqlSession session) {
		this.dao = dao;
		this.session = session;
	}

	@Override
	public List<Map<String, Object>> selectMatchDate() {
		return dao.selectMatchDate(session);
	}
	
	@Override
	public int insertChampPredict(Map<String, String> param) {
		return dao.insertChampPredict(session, param);
	}
	
	@Override
	public int insertBanpickPredict(Map<String, String> param) {
		return dao.insertBanpickPredict(session, param);
	}
	
	@Override
	public List<Map<String, Object>> selectMatchData() {
		return dao.selectMatchData(session);
	}
	
	@Override
	public List<String> selectMemberPredict(int no) {
		return dao.selectMemberPredict(session, no);
	}
	
	@Override
	public List<Integer> selectYesterDayPredict() {
		return dao.selectYesterDayPredict(session);
	}
	
	@Override
	public int updateMemberScore(Map<String, Object> param) {
		return dao.updateMemberScore(session, param);
	}
	
	@Override
	public int updatePlayYn(String email) {
		return dao.updatePlayYn(session, email);
	}
	
	@Override
	public String selectPredictYn(String email) {
		return dao.selectPredictYn(session, email);
	}
	
	@Override
	public int updateMemberPoiont() {
		return dao.updateMemberPoiont(session);	
	}
	
	@Override
	public int insertPointHistory(int no) {
		return dao.insertPointHistory(session, no);
	}

}
