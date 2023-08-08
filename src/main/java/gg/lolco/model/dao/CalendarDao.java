package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.MatchSchedule;

public interface CalendarDao {
	
	List<MatchSchedule> selectByMatchSchedule(SqlSession session, Map<String, String> param);
	
}
