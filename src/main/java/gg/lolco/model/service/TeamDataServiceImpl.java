package gg.lolco.model.service;

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

}
