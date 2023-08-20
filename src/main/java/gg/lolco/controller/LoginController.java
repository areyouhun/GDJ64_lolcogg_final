package gg.lolco.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

//import com.fasterxml.jackson.databind.JsonNode;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import gg.lolco.common.AESEncryptor;
import gg.lolco.model.service.MemberService;
import gg.lolco.model.vo.Member;

@Controller
@SessionAttributes({ "loginMember", "loginAdmin" })
@RequestMapping("/login")
public class LoginController {

	private final Environment env;
	private final RestTemplate restTemplate = new RestTemplate();
	private String CLIENT_ID = "dNio2a8IwW1bwAeDTYAA"; //네이버 애플리케이션 클라이언트 아이디값;
	private String CLI_SECRET = "l3RVViZgBW"; //네이버 애플리케이션 클라이언트 시크릿값;

	private final MemberService service;

	public LoginController(MemberService service, Environment env) {
		this.env = env;
		this.service = service;
	}

//카카오 로그인 처리
	@GetMapping("/KakaoLoginCheck")
	@ResponseBody
	public Member KakaoLoginCheck(@RequestParam Map<Object, String> param) {
		System.out.println("여기오니?");
		System.out.println(param.get("memberEmail"));
		// EMAIL : DB이메일(암호화상태)과 매칭을 위해 로그인 이메일 암호화
		try {
			param.put("email", AESEncryptor.encrypt(param.get("memberEmail")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(param.get("email"));
		Member m = service.selectMemberById(param);
		System.out.println(m);
		return m;
	}

	@GetMapping("/Kakaoenroll")
	public String Kakaoenroll(@RequestParam Map<Object, String> param, Model model) {
		try {
			param.put("email", AESEncryptor.encrypt(param.get("memberEmail")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String memberEmail = (String) param.get("email");
		String memberNickname = (String) param.get("memberNickname") +"(카카오)";
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

		// 회원가입 축하 포인트 지급 - 1000포인트
		Map pointOffer = Map.of("email", member.getEmail(), "point", 1000);
		// 포인트 지급 내역 저장
		Map insertPointHistoryByLolcoggEnroll = Map.of("email", member.getEmail(), "phComment", "웰컴 포인트(회원가입 기념 포인트)",
				"phPoint", pointOffer.get("point"));
		result = service.insertPointHistoryByLolcoggEnroll(insertPointHistoryByLolcoggEnroll);

		// EMAIL : param-DB 매칭
		Member m = service.selectMemberById(param);
		model.addAttribute("loginMember", m);
		return "redirect:/";
	}

	@GetMapping("KakaoLogin")
	public String KakaoLogin(@RequestParam Map<Object, String> param, Model model) {
		try {
			param.put("email", AESEncryptor.encrypt(param.get("memberEmail")));
		} catch (Exception e) {
			e.printStackTrace();
		}
//		String memberEmail = (String) param.get("email");
//		String memberNickname = (String) param.get("memberNickname");//업데이트문 처리필요
//		String memberImage = (String) param.get("memberImage");//업데이트문 처리필요
//		(이미지 불러오는 업데이트 버전업 처리할 경우 비밀번호가 '카카오로그인'이 아닌 '카카오'인 경우 비밀번호를 '카카오로그인'으로 업데이트 하는 조건문 추가 필요함 - 프로필 이미지 분기문 조건에 관련이 있음 - DB설계에 대한 실수)
//		[참조 : MypageController updateProfileImg() 하단부]
//		네이버 계정 등록 경우도 마찬가지로 비밀번호가 '네이버로그인'이 아닌 '네이버'인 경우 비밀번호를 '네이버로그인'으로 업데이트 하는 조건문 추가 필요
		
		Member member = service.selectMemberById(param);
		model.addAttribute("loginMember", member);
		return "redirect:/";
	}
	
	//네이버로그인처리
   @RequestMapping("/naverLogin")
	public String naverLogin(String code, String state, Model model) throws IOException, ParseException {
//		System.out.println(code);
//		System.out.println(state);
//		String redirectURI = URLEncoder.encode("http://localhost:7070/login/naverLogin", "UTF-8");
		String redirectURI = URLEncoder.encode("http://14.36.141.71:10005/GDJ64_lolcogg_final/login/naverLogin", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + CLIENT_ID;
		apiURL += "&client_secret=" + CLI_SECRET;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		// System.out.println("apiURL=" + apiURL);
		String res = requestToServer(apiURL);
		if (res != null && !res.equals("")) {
//			System.out.println(res);
			model.addAttribute("res", res);
			Map<String, Object> parsedJson = new JSONParser(res).parseObject();
//	         System.out.println(parsedJson);
			String accessToken = (String) parsedJson.get("access_token");
			// 액세스 토큰으로 네이버에서 프로필 받기
			String apiURL2 = "https://openapi.naver.com/v1/nid/me";
			String headerStr = "Bearer " + accessToken; // Bearer 다음에 공백 추가
			String res2 = requestToServer(apiURL2, headerStr);
//			System.out.println(res2);
			if (res2 != null && !res.equals("")) {
//				System.out.println(res2);
				model.addAttribute("res", res2);
				Map<String, Object> parsedJson2 = new JSONParser(res2).parseObject();
//				System.out.println(parsedJson2 );
				JsonObject obj = JsonParser.parseString(res2.toString()).getAsJsonObject();
				JsonObject arr = (JsonObject) obj.get("response");
//				System.out.println("arr : " + arr);
				String memberNickname = arr.get("name").getAsString() +"(네이버)";
				String memberImage = arr.get("profile_image").getAsString();
				String memberEmail = arr.get("email").getAsString();
				try {
					memberEmail =  AESEncryptor.encrypt(memberEmail);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				// EMAIL : param-DB 매칭
				Map param = new HashMap<>();
				param.put("email", memberEmail);
				Member m = service.selectMemberById(param);
				
				if(m!=null) {
					model.addAttribute("loginMember", m);
				}else {
					
					// 추천인코드 생성
					String randomValue = generateRandomValue();
					
					Member member = Member.builder()
							.email(memberEmail).password("네이버로그인").nickname(memberNickname)
							.profile(memberImage).teamAbbr("").titleName("")// 칭호
							.totalExp(0).totalPoints(0).myReferralCode(randomValue)
	//						.enrollDate(default)//mybatis에서 입력
	//						.withdrawDate(null)//mybatis에서 입력
							.authority("일반유저")
	//		      		.isBanned(default)//mybatis에서 입력
	//		      		.hasDragon(default)//mybatis에서 입력
							.build();
					int result = service.insertMember(member);
					
					// 회원가입 축하 포인트 지급 - 3000포인트
					Map pointOffer = Map.of("email", member.getEmail(), "point", 3000);
					result = service.insertPointToEmail(pointOffer);
					// 포인트 지급 내역 저장
					Map insertPointHistoryByLolcoggEnroll = Map.of("email", member.getEmail(), "phComment", "웰컴 포인트(회원가입 기념 포인트)",
							"phPoint", pointOffer.get("point"));
					result = service.insertPointHistoryByLolcoggEnroll(insertPointHistoryByLolcoggEnroll);
					
					Member m2 = service.selectMemberById(param);
					model.addAttribute("loginMember", m2);
				}
			}
		} else {
			model.addAttribute("res", "Login failed!");
		}
		return "redirect:/";
	}

	   private String requestToServer(String apiURL, String headerStr) throws IOException {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection) url.openConnection();
	      con.setRequestMethod("GET");
//	      System.out.println("header Str: " + headerStr);
	      if (headerStr != null && !headerStr.equals("")) {
	         con.setRequestProperty("Authorization", headerStr);
	      }
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
//	      System.out.println("responseCode=" + responseCode);
	      if (responseCode == 200) { // 정상 호출
	         br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else { // 에러 발생
	         br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	         res.append(inputLine);
	      }
	      br.close();
	      if (responseCode == 200) {
	         return res.toString();
	      } else {
	         return null;
	      }
	   }
	   private String requestToServer(String apiURL) throws IOException {
	      return requestToServer(apiURL, "");
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