package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.CalendarDao;
import gg.lolco.model.vo.MatchSchedule;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	private final CalendarDao dao;
	private final SqlSession session;
	
	public CalendarServiceImpl(CalendarDao dao, SqlSession session) {
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<MatchSchedule> selectByMatchSchedule(Map<String, String> param) {
		return dao.selectByMatchSchedule(session, param);
	}
	
}
