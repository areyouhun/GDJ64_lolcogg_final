package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.SampleDao;

@Service
public class SampleServiceImpl implements SampleService {
	private final SampleDao dao;
	private final SqlSession session;
	
	public SampleServiceImpl(SampleDao dao, SqlSession session) {
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<Map<String, Object>> selectAll() {
		return dao.selectAll(session);
	}
}
