package gg.lolco.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import gg.lolco.model.service.MemberService;
import gg.lolco.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
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
	
	//페이지 이동========================
	//메인페이지 -> 로그인 페이지
	@GetMapping("/loginPage")
	public String loginPage() {
		return "member/login";
	}
	//로그인페이지 -> 회원가입 페이지
	@GetMapping("/enrollMember.do")
	public String enrollMember() {
		return "member/enrollMember";
	}
	//================================
	
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
	
	@RequestMapping("/logout.do")
	public String logout(SessionStatus status) {
//		if(session!=null)
//			session.invalidate();
//		if(1==1) throw new IllegalArgumentException("잘못된 접근입니다");
		
		if(!status.isComplete()) status.setComplete();
		
		return "redirect:/";
	}
}
