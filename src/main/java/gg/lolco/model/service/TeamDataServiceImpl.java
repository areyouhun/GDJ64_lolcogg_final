package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.TeamDataDao;

@Service
public class TeamDataServiceImpl implements TeamDataService {
	private final TeamDataDao dao;
	private final SqlSession session;
	
	public TeamDataServiceImpl(TeamDataDao dao, SqlSession session) {
		this.dao = dao;
		this.session = session;
	}

	@Override
	public Map<String, Object> selectTeamByAbbr(String abbr) {
		return dao.selectTeamByAbbr(session, abbr);
	}
	
	@Override
	public List<Map<String, Object>> selectMatchScheduleByAbbr(String abbr) {
		return dao.selectMatchScheduleByAbbr(session, abbr);
	}

	@Override
	public List<Map<String, Object>> selectMatchHistoryByAbbr(String abbr) {
		return dao.selectMatchHistoryByAbbr(session, abbr);
	}

	@Override
	public Map<String, Object> selectPlayerByNickname(String nickname) {
		return dao.selectPlayerByNickname(session, nickname);
	}

	@Override
	public Map<String, Object> selectMatchResultByKeyword(Map<String, String> keyword) {
		return dao.selectMatchResultByKeyword(session, keyword);
	}

	@Override
	public List<Map<String, Object>> selectMatchHistoryByTeams(Map<String, String> teams) {
		return dao.selectMatchHistoryByTeams(session, teams);
	}

	@Override
	public int selectCountMatchesOfTeams(Map<String, String> teams) {
		return dao.selectCountMatchesOfTeams(session, teams);
	}

	@Override
	public int selectCountTeamLeftWins(Map<String, String> teams) {
		return dao.selectCountTeamLeftWins(session, teams);
	}

}
