package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.Report;

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
	public int insertPointHistoryByLolcoggEnroll(SqlSession session, Map insertPointHistoryByLolcoggEnroll) {
		return session.insert("member.insertPointHistoryByLolcoggEnroll", insertPointHistoryByLolcoggEnroll);
	}

	@Override
	public String searchEmailByReferralCode(SqlSession session, String myReferralCode) {
		return session.selectOne("member.searchEmailByReferralCode", myReferralCode);
	}

	@Override
	public int insertEmotionOffer(SqlSession session, Map emotionOfferValue) {
		return session.insert("member.insertEmotionOffer", emotionOfferValue);
	}

	@Override
	public int selectRandomCardnoFromTeamname(SqlSession session, String teamName) {
		return session.selectOne("member.selectRandomCardnoFromTeamname", teamName);
	}

	@Override
	public int insertCardOffer(SqlSession session, Map cardOfferValue) {
		return session.insert("member.insertCardOffer", cardOfferValue);
	}

	@Override
	public int updateStatus(SqlSession session) {
		return session.update("member.updateStatus");
	}
	
	public int ban(SqlSession session, String nickname) {
		return session.update("member.ban", nickname);
	}

	@Override
	public List<Map<String, Object>> selectMemberAll(SqlSession session) {
		return session.selectList("member.selectMemberAll");
	}
	
	@Override
	public List<Member> memberList(SqlSession session,Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("member.memberList",null,rb);
	}
	
	@Override
	public int memberListCount(SqlSession session) {
		return session.selectOne("member.memberListCount");
	}
}
