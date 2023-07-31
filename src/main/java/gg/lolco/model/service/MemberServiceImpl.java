package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.MemberDao;
import gg.lolco.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	private final MemberDao dao;
	private final SqlSession session;
	
	public MemberServiceImpl(MemberDao dao, SqlSession session) {
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<Map<String, Object>> selectAll() {
		return dao.selectAll(session);
	}

	@Override
	public Member selectMemberById(Map param) {
		// TODO Auto-generated method stub
		return dao.selectMemberById(session, param);
	}
}
