package gg.lolco.controller;

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
	public String insertMember(@RequestParam(value="email") String email,
			@RequestParam(value="password_1") String password,
			@RequestParam(value="nickName") String nickName,
			@RequestParam(value="abbr") String abbr,
			@RequestParam(value="file") String file,
			@RequestParam(value="abbrCode") String abbrCode
			) {
		System.out.println(email);
		System.out.println(password);
		System.out.println(nickName);
		System.out.println(abbr);
		System.out.println(file);
		System.out.println(abbrCode);
		return email;
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
	
}
