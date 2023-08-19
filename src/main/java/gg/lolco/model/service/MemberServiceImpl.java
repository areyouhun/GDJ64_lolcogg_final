package gg.lolco.model.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.MemberDao;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.Report;

@Service
public class MemberServiceImpl implements MemberService {
	
	private final MemberDao dao;
	private final SqlSession session;

	//회원가입_이메일인증
	 private final JavaMailSenderImpl javaMailSender ;
	//난수 생성용 변수(111111-999999)
	 private int authNumber;
	 
	public MemberServiceImpl(MemberDao dao, SqlSession session,
			JavaMailSenderImpl javaMailSender) {
		this.dao = dao;
		this.session = session;
		this.javaMailSender = javaMailSender;
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

//	회원가입_로그인인증
    @Override
    public void makeRandomNumber() {
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
//        log.info("checkNum : " + checkNum);
        authNumber = checkNum;
    }
    @Override
    public String joinEmail(String email) {
        makeRandomNumber();
 
        String toMail = email;
        String title = "회원가입을 위한 인증메일입니다.";
        String message =
                "lolcogg를 방문해주셔서 감사합니다." +
                "<br><br>" +
                "인증번호는 " + authNumber + " 입니다." +
                "<br><br>" +
                "해당 인증번호를 인증번호 확인한에 기입하여 주시기바랍니다.";
        mailSend(message,toMail, title);
        return Integer.toString(authNumber);
    }
    @Override
    public void mailSend(String message,String toMail, String title) {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            helper.setTo(toMail);
            helper.setSubject(title);
            // true 입력시 html 양식으로 전달. 제외하면 일반 텍스트 형식.
            helper.setText(message,true);
            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

	@Override
	public int emailCheck(String email) {
		return dao.emailCheck(session, email);
	}	
	@Override
	public int nickNameCheck(String nickName) {
		return dao.nickNameCheck(session, nickName);
	}	
	@Override
	public int myReferralCodeCheck(String myReferralCode) {
		return dao.myReferralCodeCheck(session, myReferralCode);
	}

	@Override
	public int insertMember(Member member) {
		 return dao.insertMember(session, member);
	}

	@Override
	public int insertPointToEmail(Map pointOffer) {
		return dao.insertPointToEmail(session, pointOffer);
	}

	@Override
	public int insertPointHistoryByReferralCode(Map PointHistoryByReferralCode) {
		return dao.insertPointHistoryByReferralCode(session, PointHistoryByReferralCode);
	}
	
	@Override
	public int insertPointHistoryByLolcoggEnroll(Map insertPointHistoryByLolcoggEnroll) {
		return dao.insertPointHistoryByLolcoggEnroll(session, insertPointHistoryByLolcoggEnroll);
	}
	
	@Override
	public String searchEmailByReferralCode(String myReferralCode) {
		return dao.searchEmailByReferralCode(session, myReferralCode);
	}

	@Override
	public int insertEmotionOffer(Map emotionOfferValue) {
		// TODO Auto-generated method stub
		return dao.insertEmotionOffer(session, emotionOfferValue);
	}

	@Override
	public int selectRandomCardnoFromTeamname(String teamName) {
		return dao.selectRandomCardnoFromTeamname(session, teamName);
	}

	@Override
	public int insertCardOffer(Map cardOfferValue) {
		return dao.insertCardOffer(session, cardOfferValue);
	}

	@Override
	public int updateStatus() {
		return dao.updateStatus(session);
	}
	
	public int ban(String nickname) {
		return dao.ban(session, nickname);
	}

	@Override
	public List<Map<String, Object>> selectMemberAll() {
		return dao.selectMemberAll(session);
	}	
	
	@Override
	public List<Member> memberList(Map<String, Object> param) {
		return dao.memberList(session,param);
	}

	@Override
	public int memberListCount() {
		// TODO Auto-generated method stub
		return dao.memberListCount(session);
	}
	
}
