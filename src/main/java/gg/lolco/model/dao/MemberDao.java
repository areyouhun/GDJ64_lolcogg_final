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
	
	//회원가입
	int insertMember(SqlSession session, Member member);
	//계정에 포인트 지급
	int insertPointToEmail(SqlSession session, Map pointOffer);
	//추천인 코드 입력 관련 계정 포인트 지급 기록 작성
	int insertPointHistoryByReferralCode(SqlSession session, Map PointHistoryByReferralCode);
	//회원가입 입력 관련 계정 포인트 지급 기록 작성
	int insertPointHistoryByLolcoggEnroll(SqlSession session, Map pointHistoryByReferralCode);
	//추천인 코드 제공한 계정(암호화상태) 조회
	String searchEmailByReferralCode(SqlSession session, String myReferralCode);
	// 응원팀 이모티콘 제공
	int insertEmotionOffer(SqlSession session, Map emotionOfferValue);
	// 응원팀 랜덤 카드 번호 조회
	int selectRandomCardnoFromTeamname(SqlSession session, String teamName);
	// 카드 제공
	int insertCardOffer(SqlSession session, Map cardOfferValue);

	int updateStatus(SqlSession session);
	
	// ban a user kicked out from the chatroom
	int ban(SqlSession session, String nickname);
	
	List<Map<String, Object>> selectMemberAll(SqlSession session);

	//회원 목록 조회
	List<Member> memberList(SqlSession session, Map<String, Object> param);
	//회원 수 조회
	int memberListCount(SqlSession session);

}
