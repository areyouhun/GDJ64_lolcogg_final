package gg.lolco.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import gg.lolco.common.PageFactory;
import gg.lolco.model.service.QnaService;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberEmoticon;
import gg.lolco.model.vo.QaBoard;
import gg.lolco.model.vo.QaBoardComment;
import gg.lolco.model.vo.QaBoardFile;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/qna")
@Slf4j
public class QnaController {
	
	private QnaService service;
	
	public QnaController(QnaService service) {
		this.service = service;
	}
	
//	qna 목록 조회
	@RequestMapping("/qnaList")
	public String qnaList(@RequestParam(value = "cPage", defaultValue = "1") int cPage, @RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, Model m) {
		List<QaBoard> qb = service.selectQnaListAll(Map.of("cPage", cPage, "numPerpage", numPerpage));
		int totalData = service.selectQnaListCount();
		
		m.addAttribute("qb", qb);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "qnaList","fn_paging"));
		
		return "qna/qnaList";
	}
	
//	내가 쓴 글 조회
	@RequestMapping("/myQnaList")
	public String myQnaList(@RequestParam(value = "cPage", defaultValue = "1") int cPage, @RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, @SessionAttribute(name = "loginMember", required = false) Member member, Model m) {
		String email = member.getEmail();
		
		List<QaBoard> qb = service.selectQnaListById(Map.of("cPage", cPage, "numPerpage", numPerpage, "email", email));
		int totalData = service.selectQnaListCountById(email);
		
		m.addAttribute("qb", qb);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "qnaList", "fn_paging"));
		
		return "qna/qnaList";
	}
	
//	qna 글, 댓글 조회
	@RequestMapping("/qnaView")
	public String qnaView(Model m, int no, @SessionAttribute(name = "loginMember", required = false) Member member) {
		QaBoard qb = service.qnaView(no);
		List<QaBoardComment> qbc = service.selectCommentAll(no);
		
		m.addAttribute("qb", qb);
		m.addAttribute("qbc", qbc);
		return "qna/qnaView";
	}
	
//	qna 등록
	@PostMapping("/insertQnaEnd")
	public String insertQna(@RequestParam Map param , Model m, MultipartFile[] qaFile, HttpSession session) {
		
		// 절대경로
		String path = session.getServletContext().getRealPath("/resources/upload/qna/");
		List<QaBoardFile> files=new ArrayList<>();
		if(qaFile != null) {
			for(MultipartFile mf : qaFile) {
				if(!mf.isEmpty()) {
					// 파일 등록
					String oriName = mf.getOriginalFilename();
					String ext = oriName.substring(oriName.lastIndexOf(".")); // 확장자명
					Date today = new Date(System.currentTimeMillis());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rdn = (int)(Math.random()*10000) + 1; // 랜덤값 부여
					String rename = sdf.format(today) + "_" + rdn + ext; // rename명
					
					try {
						mf.transferTo(new File(path + rename));
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					QaBoardFile file = QaBoardFile.builder()
							.qaOriFilename(oriName)
							.qaRnmFilename(rename)
							.build();
					
					files.add(file);
				}
			}
			param.put("qaFile", files);
		}
		
		try {
			service.insertBoard(param);
		} catch(RuntimeException e) {
			m.addAttribute("msg", "문의 등록 실패");
			m.addAttribute("loc", "/qna/qnaList");
			return "common/msg";
		}
		
		return "redirect:/qna/qnaList";
	}
	
//	qna 수정
	@PostMapping("/updateQna")
	public String updateQna(@RequestParam Map<String,Object> param , Model m, MultipartFile[] qaFile, HttpSession session) {
		
		// 절대경로
		String path = session.getServletContext().getRealPath("/resources/upload/qna/");
		List<QaBoardFile> files=new ArrayList<>();
		if(qaFile != null) {
			for(MultipartFile mf : qaFile) {
				if(!mf.isEmpty()) {
					// 파일 등록
					String oriName = mf.getOriginalFilename();
					String ext = oriName.substring(oriName.lastIndexOf(".")); // 확장자명
					Date today = new Date(System.currentTimeMillis());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rdn = (int)(Math.random()*10000) + 1; // 랜덤값 부여
					String rename = sdf.format(today) + "_" + rdn + ext; // rename명
					
					try {
						mf.transferTo(new File(path + rename));
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					QaBoardFile file = QaBoardFile.builder()
							.qaOriFilename(oriName)
							.qaRnmFilename(rename)
							.build();
					
					files.add(file);
				}
			}
			param.put("qaFile", files);
		}
		
		try {
			service.updateBoard(param,files);
		} catch(RuntimeException e) {
			m.addAttribute("msg", "문의 수정 실패");
			m.addAttribute("loc", "/qna/qnaList");
			return "common/msg";
		}
		m.addAttribute("msg", "수정이 완료되었습니다.");
		m.addAttribute("loc", "/qna/qnaView?no=" + param.get("qaNo"));
		
		return "common/msg";
	}
	
	
//	qna 삭제
	@RequestMapping("/deleteQna")
	public String deleteQna(int no, Model m) {
		int result = service.deleteQna(no);
		
		String loc = "/qna/qnaList";
		m.addAttribute("loc", loc);
		if(result > 0) m.addAttribute("msg", "문의글 삭제 완료");
		else m.addAttribute("msg", "문의글 삭제 실패");
		
		return "common/msg";
	}
	
//	qna 댓글 등록
	@PostMapping("/insertComment")
	@ResponseBody
	public List<QaBoardComment> insertComment(@RequestParam Map param) {
		int qaNo = Integer.parseInt((String.valueOf(param.get("qaNo"))));
		
		// 댓글 등록
		int result = service.insertComment(param);
		
		if(result > 0) {
			// 성공 -> 댓글목록 가져와 리턴
			List<QaBoardComment> qbc = service.selectCommentAll(qaNo);
			return qbc;
		} else {
			return null;
		}
	}
	
// 댓글 삭제(ajax)
	@PostMapping("/deleteComment")
	@ResponseBody
	public int deleteComment(@RequestParam String qaNo) {
		int result = service.deleteComment(qaNo);
		return result;
	}
	
}
