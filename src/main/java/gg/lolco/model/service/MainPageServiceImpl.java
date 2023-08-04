package gg.lolco.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.MainPageDao;
import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.Team;

@Service
public class MainPageServiceImpl implements MainPageService {

	private MainPageDao dao;
	private SqlSessionTemplate session;

	public MainPageServiceImpl(MainPageDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<MatchSchedule> todayMs() {
		return dao.todayMs(session);
	}

	@Override
	public List<Team> teamRank() {
		return dao.teamRank(session);
	}

	
}
