package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.MatchSchedule;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Override
	public List<MatchSchedule> selectByMatchSchedule(SqlSession session, Map<String, String> param) {
		return session.selectList("calendar.selectByMatchSchedule", param);
	}

}
