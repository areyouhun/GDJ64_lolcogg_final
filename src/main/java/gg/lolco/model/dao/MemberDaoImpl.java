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

	@Override
	public int emailCheck(SqlSession session, String email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.emailCheck",email);
	}
	
	@Override
	public int nickNameCheck(SqlSession session, String nickName) {
		// TODO Auto-generated method stub
		return session.selectOne("member.nickNameCheck",nickName);
	}
	
	@Override
	public int myReferralCodeCheck(SqlSession session, String myReferralCode) {
		// TODO Auto-generated method stub
		return session.selectOne("member.myReferralCodeCheck",myReferralCode);
	}
	
    @Override
    public int insertMember(SqlSession session, Member member) {
    	return session.insert("member.insertMember", member);
    }

	@Override
	public int insertPointToEmail(SqlSession session, Map pointOffer) {
		return session.insert("member.insertPointToEmail", pointOffer);
	}

	@Override
	public int insertPointHistoryByReferralCode(SqlSession session, Map PointHistoryByReferralCode) {
		return session.insert("member.insertPointHistoryByReferralCode", PointHistoryByReferralCode);
	}

	@Override
	public String searchEmailByReferralCode(SqlSession session, String myReferralCode) {
		return session.selectOne("member.searchEmailByReferralCode", myReferralCode);
	}

	
}
