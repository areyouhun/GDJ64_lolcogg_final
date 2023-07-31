package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public List<Map<String, Object>> selectAll(SqlSession session) {
		return session.selectList("sample.selectAll");
	}

	@Override
	public Member selectMemberById(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberById",param);
	}
	
}
