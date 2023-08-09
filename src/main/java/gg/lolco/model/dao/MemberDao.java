package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.Member;

public interface MemberDao {

	List<Map<String, Object>> selectAll(SqlSession session);
	
	Member selectMemberById(SqlSession session, Map param);

	//(중복체크)
	// 아이디
	public int emailCheck(SqlSession session, String email);
	// 닉네임
	public int nickNameCheck(SqlSession session, String nickName);
	// 추천인 코드
	public int myReferralCodeCheck(SqlSession session, String myReferralCode);
}
