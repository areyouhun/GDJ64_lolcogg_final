package gg.lolco.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.Team;

@Repository
public class MainPageDaoImpl implements MainPageDao {

	@Override
	public List<MatchSchedule> todayMs(SqlSessionTemplate session) {
		return session.selectList("mainPage.todayMs");
	}

	@Override
	public List<Team> teamRank(SqlSessionTemplate session) {
		return session.selectList("mainPage.teamRank");
	}

}
