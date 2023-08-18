package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gg.lolco.model.dao.ScheduleDao;

@Service
public class ScheduleServiceImpl implements SchedulerService {
	
	private SqlSession session;
	private ScheduleDao dao;
	
	public ScheduleServiceImpl(SqlSession session, ScheduleDao dao) {
		this.session = session;
		this.dao = dao;
	}

	@Transactional
	@Override
	public int updatePlayerFile(List<Map<String, String>> param) {
		int result = 1;
		
		for(Map<String, String> data : param) {
			result = dao.updatePlayerFile(session, data);
		} return result;
	}
	
	@Transactional
	@Override
	public int updateMatchFile(List<Map<String, String>> param) {
		int result = 1;
		
		for(Map<String, String> data : param) {
			result = dao.updateMatchFile(session, data);
		} return result;
	}
	
	@Transactional
	@Override
	public int updateTeamRanking(List<Map<String, String>> param) {
		int result = 1;
		
		for(Map<String, String> data : param) {
			result = dao.updateTeamRanking(session, data);
		} return result;
	}

	@Transactional
	@Override
	public int updateRegionalMatch(List<Map<String, String>> param) {
		int result = 1;
		
		for(Map<String, String> data : param) {
			result = dao.updateRegionalMatch(session, data);
		} return result;
	}
	
	@Override
	public int updateMatchTeam(List<Map<String, String>> param) {
		int result = 1;
		
		for(Map<String, String> data : param) {
			result = dao.updateMatchTeam(session, data);
		} return result;	
	}
	
}
