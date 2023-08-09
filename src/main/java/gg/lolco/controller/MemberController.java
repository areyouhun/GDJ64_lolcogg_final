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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import gg.lolco.model.service.MemberService;
import gg.lolco.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
@Slf4j
public class MemberController {
	private final MemberService service;
	public MemberController(MemberService service) {
		this.service = service;
	}
//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;
	
//	@GetMapping("/sampleAll")
//	public String selectAll(Model model) {
//		model.addAttribute("sample", service.selectAll());
//		return "sample/sampleList";
//	}
	
	//로그인
	@PostMapping("/loginCheck")
	public String loginCheck(@RequestParam Map param, Model model, HttpSession session) {
		Member m= service.selectMemberById(param);
		System.out.println(m);
		if(m!=null
				&&
//			passwordEncoder.matches((String)param.get("password"), m.getPassword()) //암호화
			m.getPassword().equals(param.get("password"))
				) {
			model.addAttribute("loginMember", m);//@SessionAttributes({"loginMember"}) 
			
		}else {
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("loc","/");
			return "common/msg";
		}
		return "redirect:/";
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(SessionStatus status) {
//		if(session!=null)
//			session.invalidate();
//		if(1==1) throw new IllegalArgumentException("잘못된 접근입니다");
		
		if(!status.isComplete()) status.setComplete();
		
		return "redirect:/";
	}
	
	//회원가입
	@PostMapping("/insertMember.do")
	public String insertMember(@RequestParam Map<Object, String> param,
			@RequestParam(value="file") MultipartFile file,
			HttpSession session,
			Model m
			) {
		//업로드파일 저장하기
//		System.out.println(param.get("file"));
		if(!file.isEmpty()) {
			String path =session.getServletContext().getRealPath("/resources/upload/profile/");
			String oriName=file.getOriginalFilename();
			String ext=oriName.substring(oriName.lastIndexOf("."));
			Date today=new Date(System.currentTimeMillis());
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdn=(int)(Math.random()*10000)+1;
			String rename=sdf.format(today)+"_"+rdn+"_"+param.get("email")+ext;
			try {
				file.transferTo(new File(path+rename));//import java.io.File;
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			param.put("file", rename);
			System.out.println(param);
		}
        
        //추천인코드 생성
        String randomValue = generateRandomValue();
        System.out.println("Random Value: " + randomValue);
        
        //회원가입
        //널값 유의 : abbr, file, myReferralCode
        System.out.println(param);
        Member member = Member.builder()
        		.email(param.get("email"))
        		.password(param.get("password_1"))
        		.nickname(param.get("nickName"))
        		.profile(param.get("file"))
        		.teamAbbr(param.get("abbr"))
        		.titleName("")//칭호
        		.myTier("브론즈")
        		.totalExp(0)
        		.totalPoints(0)
        		.myReferralCode(randomValue)
//					.enrollDate(default)//mybatis에서 입력
//					.withdrawDate(null)//mybatis에서 입력
        		.authority("일반유저")
        		.build();
        System.out.println(member);
        int result=service.insertMember(member);
        m.addAttribute("msg",result>0?"저장성공":"저장실패");
        m.addAttribute("loc","/");
        return "common/msg";
        
	}
	
	//회원가입_이메일인증
	@PostMapping(value = "/api/mailcheck", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> mailCheck(@RequestBody HashMap<String, Object> user){
	    String username = (String) user.get("username");
	    String authNum = service.joinEmail(username);
	    log.info("email : " + user.get("username"));
	    log.info("checkNum : " + authNum);
	    return ResponseEntity.status(HttpStatus.OK).body(authNum);
	}
	
	//ajax=================================================================
	//아이디 중복체크
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		int cnt = service.emailCheck(email);
		return cnt;
	}
	//닉네임 중복체크
	@PostMapping("/nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestParam("nickName") String nickName) {
		int cnt = service.nickNameCheck(nickName);
		return cnt;
	}
	//추천인코드 확인
	@PostMapping("/myReferralCode")
	@ResponseBody
	public int myReferralCodeCheck(@RequestParam("myReferralCode") String myReferralCode) {
		int cnt = service.myReferralCodeCheck(myReferralCode);
		return cnt;
	}
	//ajax=================================================================
	
	//함수
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
