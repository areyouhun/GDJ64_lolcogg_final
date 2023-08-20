package gg.lolco.controller;

import java.io.File;
import java.io.IOException;
import java.security.SecureRandom;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import gg.lolco.common.AESEncryptor;
import gg.lolco.model.service.MemberService;
import gg.lolco.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
@SessionAttributes({ "loginMember" })
public class MemberController {
	private final MemberService service;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	public MemberController(MemberService service, AESEncryptor encryptor) {
		this.service = service;
	}

	// 로그인
	@PostMapping("/loginCheck")
	public String loginCheck(@RequestParam Map<Object, String> param, Model model, HttpSession session) {

		// EMAIL : DB이메일(암호화상태)과 매칭을 위해 로그인 이메일 암호화
		try {
			param.put("email", AESEncryptor.encrypt(param.get("email")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// EMAIL : param-DB 매칭
		Member m = service.selectMemberById(param);

		if (m == null) {
			// EMAIL : 없음 - reject
			model.addAttribute("msg", "존재하지 않는 아이디입니다.");
			model.addAttribute("loc", "/member/loginPage");
			return "common/msg";
		} else if (m.getWithdrawDate() != null) {
			// EMAIL : 탈퇴처리된 이메일 - reject
			model.addAttribute("msg", "탈퇴/정지된 이메일입니다.");
			model.addAttribute("loc", "/member/loginPage");
			return "common/msg";
		} else if (m != null && encoder.matches((String) param.get("password"), m.getPassword())) {
			// PASSWORD : 비밀번호 체크 - pass
			model.addAttribute("loginMember", m);// @SessionAttributes({"loginMember"})
		} else {
			// PASSWORD : 비밀번호 체크 - reject
			model.addAttribute("msg", "비밀번호 오류입니다.");
			model.addAttribute("loc", "/member/loginPage");
			return "common/msg";
		}
		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(SessionStatus status) {
		if (!status.isComplete())
			status.setComplete();
		return "redirect:/";
	}

	// 이메일인증(회원가입)
	@PostMapping(value = "/api/mailcheck", consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> mailCheck(@RequestBody HashMap<String, Object> user) {
		String email = (String) user.get("username");
		String authNum = service.joinEmail(email);
		log.info("email : " + user.get("username"));
		log.info("checkNum : " + authNum);
		return ResponseEntity.status(HttpStatus.OK).body(authNum);
	}

	// 회원가입
	@PostMapping("/insertMember.do")
	@Transactional
	public String insertMember(@RequestParam Map<Object, String> param,
			@RequestParam(value = "file") MultipartFile file, HttpSession session, Model m) {

		// 업로드파일 저장하기
		if (!file.isEmpty()) {
			String path = session.getServletContext().getRealPath("/resources/upload/profile/");
			String oriName = file.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			Date today = new Date(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdn = (int) (Math.random() * 10000) + 1;
			String rename = sdf.format(today) + "_" + rdn + "_" + param.get("email") + ext;
			try {
				file.transferTo(new File(path + rename));// import java.io.File;
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			param.put("file", rename);
		}

		// 추천인코드 생성
		String randomValue = generateRandomValue();

		// 이메일 양방향 암호화
		try {
			String encryptedText = AESEncryptor.encrypt(param.get("email"));
			param.put("email", encryptedText);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 비밀번호 단방향 암호화
		param.put("password_1", encoder.encode(param.get("password_1")));
		Member member = Member.builder().email(param.get("email")).password(param.get("password_1"))
				.nickname(param.get("nickName")).profile(param.get("file")).teamAbbr(param.get("abbr")).titleName("")// 칭호
				.totalExp(0).totalPoints(0).myReferralCode(randomValue)
//					.enrollDate(default)//mybatis에서 입력
//					.withdrawDate(null)//mybatis에서 입력
				.authority("일반유저")
//        		.isBanned(default)//mybatis에서 입력
//        		.hasDragon(default)//mybatis에서 입력
				.build();

//        System.out.println(member);
		int result = service.insertMember(member);

		// [추천인 코드 입력인&제공인 포인트 지급]
		if (!param.get("myReferralCode").equals("")) {
			// 1-1. 입력인 계정(암호화 상태) 포인트 지급 - 300포인트
			Map pointOffer = Map.of("email", member.getEmail(), "point", 300);
			result = service.insertPointToEmail(pointOffer);
			// 1-2. 입력인 계정(암호화 상태) 포인트 지급 기록 내역 저장
			Map PointHistoryByReferralCode = Map.of("email", member.getEmail(), "phComment", "웰컴 포인트(추천인코드 입력)",
					"phPoint", pointOffer.get("point"));
			result = service.insertPointHistoryByReferralCode(PointHistoryByReferralCode);
			// 2-1. 제공인 계정(암호화 상태) 이메일 조회
			String providerEmail = service.searchEmailByReferralCode(param.get("myReferralCode"));
			// 2-2. 제공인 계정(암호화 상태) 포인트 지급 - 200포인트
			pointOffer = Map.of("email", providerEmail, "point", 200);
			result = service.insertPointToEmail(pointOffer);
			// 2-3. 제공인 계정(암호화 상태) 포인트 지급 내역 저장
			PointHistoryByReferralCode = Map.of("email", providerEmail, "phComment", "추천인 코드 제공", "phPoint",
					pointOffer.get("point"));
			result = service.insertPointHistoryByReferralCode(PointHistoryByReferralCode);
		}
		
		// 회원가입 축하 포인트 지급 - 3000포인트
		Map pointOffer = Map.of("email", member.getEmail(), "point", 3000);
		result = service.insertPointToEmail(pointOffer);
		// 포인트 지급 내역 저장
		Map insertPointHistoryByLolcoggEnroll = Map.of("email", member.getEmail(), "phComment", "웰컴 포인트(회원가입 기념 포인트)",
				"phPoint", pointOffer.get("point"));
		result = service.insertPointHistoryByLolcoggEnroll(insertPointHistoryByLolcoggEnroll);
		
		// [ 이모티콘(응원팀 이모티콘 팩) 지급]
		if (!param.get("abbr").equals("")) {
			Map teamMapping1 = Map.of("DK", 1, "DRX", 2, "GEN", 3, "HLE", 4, "KDF", 5, "KT", 6, "LSB", 7, "NS", 8, "T1",
					9, "BRO", 10 // EMOTICON에서 팀 대표카드 조회한 PK(카드번호)
			);
			Map emotionOfferValue = Map.of("email", member.getEmail(), "emoNo", teamMapping1.get(param.get("abbr")));
			result = service.insertEmotionOffer(emotionOfferValue);
			// [응원팀 선택 시 가입 기념 카드 ]
			// 응원팀 랜덤 카드 번호 조회
			Map teamMapping2 = Map.of("DK", "dplus", "BRO", "brion", "NS", "redforce", "GEN", "geng", "T1", "t1", "HLE",
					"hanwha", "KDF", "freecs", "DRX", "drx", "KT", "kt", "LSB", "sandbox");
			String teamName = (String) teamMapping2.get(param.get("abbr"));
			int cardNo = service.selectRandomCardnoFromTeamname(teamName);
			// 카드 제공
			Map cardOfferValue = Map.of("email", member.getEmail(), "cardNo", cardNo);
			result = service.insertCardOffer(cardOfferValue);
		}

		m.addAttribute("msg", result > 0 ? "회원가입을 환영합니다." : "저장 실패");
		m.addAttribute("loc", "/");
		return "common/msg";
	}

	// ajax=================================================================
	// 아이디 중복체크
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		AESEncryptor encryptor = new AESEncryptor();
		// 입력받은 로그인 이메일 값 암호화( AES 암호화는 동일한 평문에 대해 동일한 암호문을 생성[ ECB ] )
		try {
			email = encryptor.encrypt(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int cnt = service.emailCheck(email);
		return cnt;
	}

	// 닉네임 중복체크
	@PostMapping("/nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestParam("nickName") String nickName) {
		int cnt = service.nickNameCheck(nickName);
		return cnt;
	}

	// 추천인코드 확인
	@PostMapping("/myReferralCode")
	@ResponseBody
	public int myReferralCodeCheck(@RequestParam("myReferralCode") String myReferralCode) {
		int cnt = service.myReferralCodeCheck(myReferralCode);
		return cnt;
	}
	
	// check if banned
	@GetMapping("/checkIfBanned")
	@ResponseBody
	public String checkIfBanned(HttpSession session) {
		Member member = service.selectMemberById(Map.of("email", ((Member) session.getAttribute("loginMember")).getEmail()));
		return member.getIsBanned();
	}
	
	//함수=================================================================
	//추천인코드 만들기(8자의 영어,숫자 조합)
    public static String generateRandomValue() {
        final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        final int LENGTH = 8;
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(LENGTH);
        for (int i = 0; i < LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            sb.append(randomChar);
        }
        return sb.toString();
    }
}
