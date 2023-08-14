package gg.lolco.controller;

import java.security.SecureRandom;
import java.util.Map;

import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import gg.lolco.common.AESEncryptor;
import gg.lolco.model.service.MemberService;
import gg.lolco.model.vo.Member;

//import com.dev.member.model.dto.Member;
//import com.dev.member.service.MemberService;
//import com.fasterxml.jackson.databind.JsonNode;
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;

@Controller
@SessionAttributes({ "loginMember", "loginAdmin" })
@RequestMapping("/login")
public class LoginController {

	private final Environment env;
	private final RestTemplate restTemplate = new RestTemplate();
	private final AESEncryptor encryptor; // AESEncryptor 인스턴스 추가
//   private String CLIENT_ID = "TR_SQ2GAJzrrTPobWiSh"; //네이버 애플리케이션 클라이언트 아이디값;
//   private String CLI_SECRET = "KzSC54sFgk"; //네이버 애플리케이션 클라이언트 시크릿값;

	private final MemberService service;

	public LoginController(MemberService service, Environment env, AESEncryptor encryptor) {
		this.env = env;
		this.service = service;
		this.encryptor = encryptor;
	}

//카카오 로그인 처리
	@GetMapping("/KakaoLoginCheck")
	@ResponseBody
	public Member KakaoLoginCheck(@RequestParam Map<Object, String> param) {
		System.out.println("여기오니?");
		// EMAIL : DB이메일(암호화상태)과 매칭을 위해 로그인 이메일 암호화
		try {
			param.put("email", encryptor.encrypt(param.get("memberEmail")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		Member m = service.selectMemberById(param);
		System.out.println(m);
		return m;
	}

	@GetMapping("/Kakaoenroll")
	public String Kakaoenroll(@RequestParam Map<Object, String> param, Model model) {
		String memberEmail = (String) param.get("memberEmail");
		try {
			param.put("email", encryptor.encrypt(param.get("memberEmail")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String memberNickname = (String) param.get("memberNickname");
		String memberImage = (String) param.get("memberImage");

		// 추천인코드 생성
		String randomValue = generateRandomValue();

		Member member = Member.builder()
				.email(memberEmail).password("카카오로그인").nickname(memberNickname)
				.profile(memberImage).teamAbbr("").titleName("")// 칭호
				.totalExp(0).totalPoints(0).myReferralCode(randomValue)
//				.enrollDate(default)//mybatis에서 입력
//				.withdrawDate(null)//mybatis에서 입력
				.authority("일반유저")
//      		.isBanned(default)//mybatis에서 입력
//      		.hasDragon(default)//mybatis에서 입력
				.build();
		int result = service.insertMember(member);

		// EMAIL : param-DB 매칭
		Member m = service.selectMemberById(param);
		model.addAttribute("loginMember", m);
		return "redirect:/";
	}

	@GetMapping("KakaoLogin")
	public String KakaoLogin(@RequestParam Map<Object, String> param, Model model) {
		String memberEmail = (String) param.get("memberEmail");
		try {
			param.put("email", encryptor.encrypt(param.get("memberEmail")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String memberNickname = (String) param.get("memberNickname");//업데이트문 처리필요
		String memberImage = (String) param.get("memberImage");//업데이트문 처리필요
		Member member = service.selectMemberById(param);
		model.addAttribute("loginMember", member);
		return "redirect:/";
	}

	// 함수=================================================================
	// 추천인코드 만들기(8자의 영어,숫자 조합)
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