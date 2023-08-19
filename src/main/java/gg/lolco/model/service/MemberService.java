package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.Report;

public interface MemberService {

	List<Map<String, Object>> selectAll();

	Member selectMemberById(Map param);
	
	//(회원가입_로그인 인증)
	//  난수를 생성하는 메소드
	  void makeRandomNumber();
	//  보낼 메일 양식을 만드는 메소드
	  String joinEmail(String email);
	//  메일을 보내는 메소드
	  void mailSend(String message,String email, String title);
	  
	//(중복체크)
	// 아이디
	public int emailCheck(String email);
	// 닉네임
	public int nickNameCheck(String nickName);
	// 추천인코드
	public int myReferralCodeCheck(String myReferralCode);
	
	// 회원가입
	int insertMember(Member member);
	// 계정에 포인트 지급
	int insertPointToEmail(Map pointOffer);
	// 추천인 코드 입력 관련 계정 포인트 지급 기록 작성
	int insertPointHistoryByReferralCode(Map PointHistoryByReferralCode);
	// 회원가입 축하금액 관련 계정 포인트 지급 기록 작성
	int insertPointHistoryByLolcoggEnroll(Map insertPointHistoryByLolcoggEnroll);
	// 추천인 코드를 통한 제공한 계정(암호화상태) 찾기
	String searchEmailByReferralCode(String myReferralCode);
	// 응원팀 이모티콘 제공
	int insertEmotionOffer(Map emotionOfferValue);
	// 응원팀 랜덤 카드 번호 조회
	int selectRandomCardnoFromTeamname(String teamName);
	// 카드 제공
	int insertCardOffer(Map cardOfferValue);
	
	// reset both ban and dragon status
	int updateStatus();
	
	// ban a user kicked out from the chatroom
	int ban(String nickname);
	
	// get all members
	List<Map<String, Object>> selectMemberAll();
	
	//회원 목록 조회
	List<Member> memberList(Map<String, Object> param);
	//회원 목록 수 조회
	int memberListCount();

}
