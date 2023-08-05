package gg.lolco.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import gg.lolco.common.PageFactory;
import gg.lolco.model.service.CommunityService;
import gg.lolco.model.service.MemberService;
import gg.lolco.model.vo.CommunityBoard;
import gg.lolco.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/community")
@SessionAttributes({ "loginMember" })
@Slf4j
public class CommunityController {

	private final CommunityService service;
	
	public CommunityController(CommunityService service) {
		this.service = service;
		
	}

	@RequestMapping("/selectboardList")
	public String selectboardList(
	    @RequestParam(value = "cPage", defaultValue = "1") int cPage,
	    @RequestParam(value = "numPerpage", defaultValue = "20") int numPerpage,
	    Model m) {

	    List<CommunityBoard> selectboardList = service.selectboardList(Map.of("cPage",cPage,"numPerpage",numPerpage));
	    int totalData = service.selectBoardCount();
	    
	    //이 부분에서는 현재 시간을 LocalDateTime 으로가져오기
	    LocalDateTime now = LocalDateTime.now();
	    
	    //리스트 반복문
	    for (CommunityBoard b : selectboardList) {
	    	//현재 게시글의 작성 시간을 LocalDateTime 형태로 가져오고 있습니다.
	        LocalDateTime boardDate = b.getCmBoardDate();
	        
	        //게시글의 작성 시간과 현재 시간 사이의 차이를 Duration 객체로 가져기
	        Duration duration = Duration.between(boardDate, now);
	        
	        //시간의 차이를 분 단위로 변환후 diffMinutes에 저장
	        long diffMinutes = duration.toMinutes();
	        //분기준
	        if (diffMinutes == 0) {
	            b.setTimeDifference("방금 전");
	        } else if (diffMinutes < 60) {
	            b.setTimeDifference(diffMinutes + "분 전");
	            
	            //하루기준
	        } else if (diffMinutes < 24*60) {
	            b.setTimeDifference(duration.toHours() + "시간 전");
	        } else {
	            b.setTimeDifference(boardDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
	        }
	    }
	    
	    m.addAttribute("selectboardList", selectboardList);
	    m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "selectboardList"));
	    return "/community/communityMain";
	}

	//게시판 파일 리네임
	@PostMapping("/renamefile")
	public ResponseEntity handleFileUpload(@RequestParam("image") MultipartFile file, HttpSession session) {
	    String fileName = file.getOriginalFilename();  // 원본 파일 이름
	    String ext = fileName.substring(fileName.lastIndexOf(".")); // 확장자명
	    Date today = new Date(System.currentTimeMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
        int rdn=(int)(Math.random()*10000) + 1; // 카카오톡처럼 랜덤값 부여
        String rename = sdf.format(today) + "_" + rdn + ext; // renamed 규칙
	    String newFileNameWithExt = sdf.format(today) + "_" + rdn + ext; // renamed 규칙

	    String path = session.getServletContext().getRealPath("/resources/upload/community/");
	    Path filepath = Paths.get(path, newFileNameWithExt);
	    File targetFile = new File(filepath.toString());

	    try {
	        file.transferTo(targetFile);
	        
	        // Use a Map to create a JSON-like structure
	        Map<String, String> response = new HashMap<>();
	        response.put("fileName", newFileNameWithExt);

	        return new ResponseEntity<>(response, HttpStatus.OK);
	    } catch (IOException e) {
	        e.printStackTrace();
	        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }
	}
	//글작성 중단시 업로드파일삭제
	@DeleteMapping("/deletefile")
    public ResponseEntity<String> deleteFile(@RequestParam("filename") String filename, HttpSession session) {
        String path = session.getServletContext().getRealPath("/resources/upload/community/");
        File file = new File(path + filename);

        if (file.delete()) {
            return new ResponseEntity<>("파일이 성공적으로 삭제되었습니다.", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("파일을 삭제하는데 실패했습니다.", HttpStatus.BAD_REQUEST);
        }
    }

	
	@PostMapping("/insertCommunityEnd")
	public String submitContent(@RequestParam("boardCategories") String boardCategories, @RequestParam("content1") String content,@RequestParam("title") String title, @RequestParam("video")  String video,@SessionAttribute("loginMember") Member member ,HttpSession session, Model m) {
		String email=member.getEmail();
		int insertCommunity = service.insertCommunity(Map.of("boardCategories",boardCategories,"title",title,"video",video,"content",content,"email",email));
		if(insertCommunity>0) {		
			m.addAttribute("msg", "게시글작성 완료");
			m.addAttribute("loc", "/community/selectboardList");
			
		}else {
			m.addAttribute("msg", "게시글작성 실패");
			m.addAttribute("loc", "/community/selectboardList");
		}
		  return "common/msg";  
	}
	

}
	
	

