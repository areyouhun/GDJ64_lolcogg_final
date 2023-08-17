package gg.lolco.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import gg.lolco.model.service.MemberService;
import gg.lolco.model.service.MypageService;
import gg.lolco.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MypageController {
	
	private final MypageService service;
	private MemberService serviceMember;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	public MypageController(MypageService service, MemberService serviceMember) {
		this.service = service;
		this.serviceMember = serviceMember;
	}
	
	@RequestMapping("updateAbbrTeam")
	@ResponseBody
	public String updateAbbrTeam (@RequestParam Map<Object, String> param,SessionStatus status, HttpSession session) {
//		System.out.println(param.get("email"));
//		System.out.println(param.get("choiceAbbrTeam"));
		int result = service.updateAbbrTeam(param);
		if(result>0) {
		Member memberupdate=serviceMember.selectMemberById(param);
		if(!status.isComplete()) status.setComplete();
		session.setAttribute("loginMember", memberupdate);
		}
		return "redirect:/mypage/mypage.do";
	}
	
	@RequestMapping("updateProfileImg")
	@ResponseBody
	public String updateProfileImg(@RequestParam Map<Object, String> param, @RequestParam(required = false) MultipartFile file, HttpSession session, SessionStatus status, Model m ) {
		System.out.println("email : "+param.get("email")); // 계정 이메일
		System.out.println("profileImg : "+param.get("profileImg")); // 미리보기 이미지 파일명
		System.out.println("file : "+file); // 가져온 이미지파일
		
		// 업로드파일 저장하기(업로드한 파일이 있을 때)
		if (file != null && !file.isEmpty()) {
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
			param.put("profileImg", rename); // 가져온 이미지명(재명명) 전달
		}
		
		int result = service.updateProfileImg(param);
		if(result>0) {
		Member memberupdate=serviceMember.selectMemberById(param);
		if(memberupdate.getPassword().contains("네이버로그인")) {
			param.put("password", "네이버"); //프로필 이미지 나타내는 분기문 처리 관련
			result = service.updatePasswordForProfile(param);	
		}else if(memberupdate.getPassword().contains("카카오로그인")) {
			param.put("password", "카카오"); //프로필 이미지 나타내는 분기문 처리 관련
			result = service.updatePasswordForProfile(param);	
		}
		if(!status.isComplete()) status.setComplete();
		session.setAttribute("loginMember", memberupdate);
		}
		
		return "redirect:/mypage/mypage.do";
	}
	
}
