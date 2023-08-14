package gg.lolco.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
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
   private String CLIENT_ID = "dNio2a8IwW1bwAeDTYAA"; //네이버 애플리케이션 클라이언트 아이디값;
   private String CLI_SECRET = "l3RVViZgBW"; //네이버 애플리케이션 클라이언트 시크릿값;

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
		try {
			param.put("email", encryptor.encrypt(param.get("memberEmail")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String memberEmail = (String) param.get("email");
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
		try {
			param.put("email", encryptor.encrypt(param.get("memberEmail")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String memberEmail = (String) param.get("email");
		String memberNickname = (String) param.get("memberNickname");//업데이트문 처리필요
		String memberImage = (String) param.get("memberImage");//업데이트문 처리필요
		Member member = service.selectMemberById(param);
		model.addAttribute("loginMember", member);
		return "redirect:/";
	}
	
	//네이버로그인처리
	   @RequestMapping("/naver/callback")
	   public String naverLogin(String code, String state, Model model) throws IOException, ParseException {
//		   System.out.println(code);
//		   System.out.println(state);
	      String redirectURI = URLEncoder.encode("http://localhost:7070/login/naverLoginCheck", "UTF-8");
	      String apiURL;
	      apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	      apiURL += "client_id=" + CLIENT_ID;
	      apiURL += "&client_secret=" + CLI_SECRET;
	      apiURL += "&redirect_uri=" + redirectURI;
	      apiURL += "&code=" + code;
	      apiURL += "&state=" + state;
	      //System.out.println("apiURL=" + apiURL);
	      String res = requestToServer(apiURL);
	      if (res != null && !res.equals("")) {
	         System.out.println(res);
	         model.addAttribute("res", res);
	         Map<String, Object> parsedJson = new JSONParser(res).parseObject();
//	         System.out.println(parsedJson);
	         String accessToken = (String) parsedJson.get("access_token");
	         // 액세스 토큰으로 네이버에서 프로필 받기
	         String apiURL2 = "https://openapi.naver.com/v1/nid/me";
	         String headerStr = "Bearer " + accessToken; // Bearer 다음에 공백 추가
	         String res2 = requestToServer(apiURL2, headerStr);
	         System.out.println(res2);
//	         if (res2 != null && !res.equals("")) {
////	            System.out.println(res2);
//	            model.addAttribute("res", res2);
//	            // Map<String, Object> parsedJson2 = new JSONParser(res2).parseObject();
//	            JsonObject obj = JsonParser.parseString(res2.toString()).getAsJsonObject();
//	            JsonObject arr = (JsonObject) obj.get("response");
////	            System.out.println("arr : " + arr);
//	            String memberNickname = arr.get("nickname").getAsString();
//	            String memberImage = arr.get("profile_image").getAsString();
//	            String memberEmail = arr.get("email").getAsString();
//	            Member member = service.selectByEmail(memberEmail);
////	            System.out.println(member);
//	            if(member==null) {
//	            Member m = Member.builder().memberNickname(memberNickname)
//	                  .memberImage(memberImage)
//	                  .memberEmail(memberEmail).memberCategory("N").build();
//	            service.insertMember(m);
//	            }
//	            model.addAttribute("loginMember",member);
//	         }
//	      } else {
//	         model.addAttribute("res", "Login failed!");
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