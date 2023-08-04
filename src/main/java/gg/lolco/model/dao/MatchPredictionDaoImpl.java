package gg.lolco.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.MatchPrediction;
import gg.lolco.model.vo.MatchSchedule;

@Repository
public class MatchPredictionDaoImpl implements MatchPredictionDao {

	@Override
	public int playerCount(SqlSessionTemplate session) {
		return session.selectOne("matchPrediction.playerCount");
	}

	@Override
	public int nowWeek(SqlSessionTemplate session) {
		return session.selectOne("matchPrediction.nowWeek");
	}

	@Override
	public List<MatchSchedule> week(SqlSessionTemplate session) {
		return session.selectList("matchPrediction.week");
	}

	@Override
	public List<MatchSchedule> matchScheduleByWeek(SqlSessionTemplate session, int week) {
		return session.selectList("matchPrediction.matchScheduleByWeek", week);
	}

	@Override
	public List<MatchPrediction> matchMpYn(SqlSessionTemplate session) {
		return session.selectList("matchPrediction.matchMpYn");
	}

	@Override
	public int updateMpYn(SqlSessionTemplate session) {
		return session.update("matchPrediction.updateMpYn");
	}

}
