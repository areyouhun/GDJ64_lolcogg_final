package gg.lolco.model.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;


import gg.lolco.model.vo.Member;

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
	//추천인 코드 입력 관련 계정 포인트 지급 기록 작성
	int insertPointHistoryByReferralCode(Map PointHistoryByReferralCode);
	//추천인 코드를 통한 제공한 계정(암호화상태) 찾기
	String searchEmailByReferralCode(String myReferralCode);
}
