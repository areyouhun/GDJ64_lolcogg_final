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
	public List<Map<String, Object>> selectMatchByAbbr(String abbr) {
		return dao.selectMatchByAbbr(session, abbr);
	}

	@Override
	public Map<String, Object> selectPlayerByNickname(String nickname) {
		return dao.selectPlayerByNickname(session, nickname);
	}

}
