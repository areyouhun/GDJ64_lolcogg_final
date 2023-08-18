package gg.lolco.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import gg.lolco.common.PageFactory;
import gg.lolco.model.service.CommunityService;
import gg.lolco.model.service.ReportService;
import gg.lolco.model.vo.CommunityBoard;
import gg.lolco.model.vo.CommunityBoardComment;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberEmoticon;
import gg.lolco.model.vo.Report;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/community")
@SessionAttributes({ "loginMember" })
@Slf4j
public class CommunityController {

	private final CommunityService service;
	private final ReportService rservice;

	public CommunityController(CommunityService service, ReportService rservice) {
		this.service = service;
		this.rservice = rservice;

	}

	@RequestMapping("/selectboardList")
	public String selectboardList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "20") int numPerpage, Model m) {

		List<CommunityBoard> selectboardList = service
				.selectboardList(Map.of("cPage", cPage, "numPerpage", numPerpage));
		int totalData = service.selectBoardCount();

		// 이 부분에서는 현재 시간을 LocalDateTime 으로가져오기
		LocalDateTime now = LocalDateTime.now();

		// 리스트 반복문
		for (CommunityBoard b : selectboardList) {
			// 현재 게시글의 작성 시간을 LocalDateTime 형태로 가져오고 있습니다.
			LocalDateTime boardDate = b.getCmBoardDate();

			// 게시글의 작성 시간과 현재 시간 사이의 차이를 Duration 객체로 가져기
			Duration duration = Duration.between(boardDate, now);

			// 시간의 차이를 분 단위로 변환후 diffMinutes에 저장
			long diffMinutes = duration.toMinutes();
			// 분기준
			if (diffMinutes == 0) {
				b.setTimeDifference("방금 전");
			} else if (diffMinutes < 60) {
				b.setTimeDifference(diffMinutes + "분 전");

				// 하루기준
			} else if (diffMinutes < 24 * 60) {
				b.setTimeDifference(duration.toHours() + "시간 전");
			} else {
				b.setTimeDifference(boardDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
			}
		}
		List<CommunityBoard> realTimePopularity = service.realTimePopularity();
		List<CommunityBoard> weeklyPopularity = service.weeklyPopularity();

		m.addAttribute("weeklyPopularity", weeklyPopularity);
		m.addAttribute("realTimePopularity", realTimePopularity);
		m.addAttribute("selectboardList", selectboardList);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "selectboardList","fn_paging"));
		return "/community/communityMain";
	}

	// 게시판 파일 리네임
	@PostMapping("/renamefile")
	public ResponseEntity handleFileUpload(@RequestParam("image") MultipartFile file, HttpSession session) {
		String fileName = file.getOriginalFilename(); // 원본 파일 이름
		String ext = fileName.substring(fileName.lastIndexOf(".")); // 확장자명
		Date today = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rdn = (int) (Math.random() * 10000) + 1; // 카카오톡처럼 랜덤값 부여
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

	// 글작성 중단시 업로드파일삭제
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
	public String submitContent(@RequestParam("boardCategories") String boardCategories,
			@RequestParam("content1") String content, @RequestParam("title") String title,
			@RequestParam("video") String video, @SessionAttribute("loginMember") Member member, HttpSession session,
			Model m) {

		// 유튜브주소 임베드형식으로 변경로직
		if (!video.trim().isEmpty()) { // video 파라미터가 빈 문자열이 아닐 때만 처리
			Pattern pattern = Pattern.compile(
					"(?<=v=|v\\/|\\/videos\\/|embed\\/|\\/youtu.be\\/|\\/\\/music\\.youtube\\.com\\/watch\\?v=|\\/\\/music\\.youtube\\.com\\/watch\\/\\?v=)([^#&?\\n<>]+)");
			Matcher matcher = pattern.matcher(video);
			if (matcher.find()) {
				String videoId = matcher.group(1);
				video = "https://www.youtube.com/embed/" + videoId; // 임베드 주소 형식으로 video 변수 업데이트
			}
		}

		String email = member.getEmail();
		int insertCommunity = service.insertCommunity(Map.of("boardCategories", boardCategories, "title", title,
				"video", video, "content", content, "email", email));
		if (insertCommunity > 0) {
			m.addAttribute("msg", "게시글작성 완료");
			m.addAttribute("loc", "/community/selectboardList");
		} else {
			m.addAttribute("msg", "게시글작성 실패");
			m.addAttribute("loc", "/community/selectboardList");
		}
		return "common/msg";
	}

	@GetMapping("/selectBoradCategorie")
	public String selectBoradCategorie(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "20") int numPerpage,
			@RequestParam("categorie") String categorie, Model m) {
		if (categorie.equals("null")) {
			return selectboardList(cPage, numPerpage, m);

		} else {

			List<CommunityBoard> selectBoradCategorie = service
					.selectBoradCategorie(Map.of("cPage", cPage, "numPerpage", numPerpage, "categorie", categorie));
			int totalData = service.selectBoradCategorieCount(categorie);

			// 이 부분에서는 현재 시간을 LocalDateTime 으로가져오기
			LocalDateTime now = LocalDateTime.now();

			// 리스트 반복문
			for (CommunityBoard b : selectBoradCategorie) {
				// 현재 게시글의 작성 시간을 LocalDateTime 형태로 가져오고 있습니다.
				LocalDateTime boardDate = b.getCmBoardDate();

				// 게시글의 작성 시간과 현재 시간 사이의 차이를 Duration 객체로 가져기
				Duration duration = Duration.between(boardDate, now);

				// 시간의 차이를 분 단위로 변환후 diffMinutes에 저장
				long diffMinutes = duration.toMinutes();
				// 분기준
				if (diffMinutes == 0) {
					b.setTimeDifference("방금 전");
				} else if (diffMinutes < 60) {
					b.setTimeDifference(diffMinutes + "분 전");

					// 하루기준
				} else if (diffMinutes < 24 * 60) {
					b.setTimeDifference(duration.toHours() + "시간 전");
				} else {
					b.setTimeDifference(boardDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
				}
			}
			List<CommunityBoard> realTimePopularity = service.realTimePopularity();
			List<CommunityBoard> weeklyPopularity = service.weeklyPopularity();

			m.addAttribute("weeklyPopularity", weeklyPopularity);
			m.addAttribute("realTimePopularity", realTimePopularity);
			m.addAttribute("selectboardList", selectBoradCategorie);
			m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "selectBoradCategorie","fn_paging"));
		}
		return "/community/communityMain";
	}

	@GetMapping("/selectPopularity")
	public String selectPopularity(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "20") int numPerpage,
			@RequestParam("categorie") String categorie, Model m) {
		System.out.println(categorie);

		List<CommunityBoard> selectPopularity = service
				.selectPopularity(Map.of("cPage", cPage, "numPerpage", numPerpage, "categorie", categorie));
		int totalData = service.selectPopularityCount(categorie);
		// 이 부분에서는 현재 시간을 LocalDateTime 으로가져오기
		LocalDateTime now = LocalDateTime.now();

		// 리스트 반복문
		for (CommunityBoard b : selectPopularity) {
			// 현재 게시글의 작성 시간을 LocalDateTime 형태로 가져오고 있습니다.
			LocalDateTime boardDate = b.getCmBoardDate();

			// 게시글의 작성 시간과 현재 시간 사이의 차이를 Duration 객체로 가져기
			Duration duration = Duration.between(boardDate, now);

			// 시간의 차이를 분 단위로 변환후 diffMinutes에 저장
			long diffMinutes = duration.toMinutes();
			// 분기준
			if (diffMinutes == 0) {
				b.setTimeDifference("방금 전");
			} else if (diffMinutes < 60) {
				b.setTimeDifference(diffMinutes + "분 전");

				// 하루기준
			} else if (diffMinutes < 24 * 60) {
				b.setTimeDifference(duration.toHours() + "시간 전");
			} else {
				b.setTimeDifference(boardDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
			}
			List<CommunityBoard> realTimePopularity = service.realTimePopularity();
			List<CommunityBoard> weeklyPopularity = service.weeklyPopularity();

			m.addAttribute("weeklyPopularity", weeklyPopularity);
			m.addAttribute("realTimePopularity", realTimePopularity);

			m.addAttribute("selectboardList", selectPopularity);
			m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "selectBoradCategorie","fn_paging"));
		}
		return "/community/communityMain";
	}

	@GetMapping("/searchBoard")
	public String searchBoard(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "20") int numPerpage,
			@RequestParam("selectValue") String selectValue, @RequestParam("search") String search, Model m) {
		System.out.println(selectValue);
		System.out.println(search);
		List<CommunityBoard> searchBoard = service.searchBoard(
				Map.of("cPage", cPage, "numPerpage", numPerpage, "selectValue", selectValue, "search", search));
		int totalData = service.searchBoardCount(Map.of("selectValue", selectValue, "search", search));
		System.out.println(searchBoard);
		System.out.println(totalData);
		// 이 부분에서는 현재 시간을 LocalDateTime 으로가져오기
		LocalDateTime now = LocalDateTime.now();

		// 리스트 반복문
		for (CommunityBoard b : searchBoard) {
			// 현재 게시글의 작성 시간을 LocalDateTime 형태로 가져오고 있습니다.
			LocalDateTime boardDate = b.getCmBoardDate();

			// 게시글의 작성 시간과 현재 시간 사이의 차이를 Duration 객체로 가져기
			Duration duration = Duration.between(boardDate, now);

			// 시간의 차이를 분 단위로 변환후 diffMinutes에 저장
			long diffMinutes = duration.toMinutes();
			// 분기준
			if (diffMinutes == 0) {
				b.setTimeDifference("방금 전");
			} else if (diffMinutes < 60) {
				b.setTimeDifference(diffMinutes + "분 전");

				// 하루기준
			} else if (diffMinutes < 24 * 60) {
				b.setTimeDifference(duration.toHours() + "시간 전");
			} else {
				b.setTimeDifference(boardDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
			}
		}
		List<CommunityBoard> realTimePopularity = service.realTimePopularity();
		List<CommunityBoard> weeklyPopularity = service.weeklyPopularity();

		m.addAttribute("weeklyPopularity", weeklyPopularity);
		m.addAttribute("realTimePopularity", realTimePopularity);

		m.addAttribute("selectboardList", searchBoard);
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "searchBoard","fn_paging"));

		return "/community/communityMain";
	}

	@GetMapping("/boardDetails")
	public String boardDetails(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "500") int numPerpage,
			@RequestParam("cmBoardNo") String cmBoardNo, Model m, HttpServletRequest request,
			HttpServletResponse response) {
		CommunityBoard boardDetails = service.boardDetails(cmBoardNo);

		List<CommunityBoardComment> selectBoardComment = service
				.selectBoardComment(Map.of("cPage", cPage, "numPerpage", numPerpage, "cmBoardNo", cmBoardNo));
		int totalData = service.selectBoardCommentCount(Map.of("cmBoardNo", cmBoardNo));

		// 쿠키를이용한 조회수 제한

		// 현재 시간 가져오기
		LocalDateTime now = LocalDateTime.now();
		// 다음날 00시
		LocalDateTime midnight = LocalDateTime.of(now.toLocalDate().plusDays(1), LocalTime.MIDNIGHT);
		// 두 시간 사이의 차이 계산 (초 단위)
		long secondsTillMidnight = Duration.between(now, midnight).getSeconds();

		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("boardView")) {
					oldCookie = cookie;
				}
			}
		}

		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + cmBoardNo.toString() + "]")) {
				int readCount = service.readCount(cmBoardNo);
				oldCookie.setValue(oldCookie.getValue() + "_[" + cmBoardNo + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge((int) secondsTillMidnight);
				response.addCookie(oldCookie);
				service.readDate(cmBoardNo);
			}
		} else {
			service.readCount(cmBoardNo);
			service.readDate(cmBoardNo);
			Cookie newCookie = new Cookie("boardView", "[" + cmBoardNo + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge((int) secondsTillMidnight);
			response.addCookie(newCookie);
		}

		// 현재 게시글의 작성 시간을 LocalDateTime 형태로 가져오기
		LocalDateTime boardDate = boardDetails.getCmBoardDate();

		// 게시글의 작성 시간과 현재 시간 사이의 차이를 Duration 객체로 가져오기
		Duration duration = Duration.between(boardDate, now);

		// 시간의 차이를 분 단위로 변환후 diffMinutes에 저장
		long diffMinutes = duration.toMinutes();
		// 분기준
		if (diffMinutes == 0) {
			boardDetails.setTimeDifference("방금 전");
		} else if (diffMinutes < 60) {
			boardDetails.setTimeDifference(diffMinutes + "분 전");

			// 하루기준
		} else if (diffMinutes < 24 * 60) {
			boardDetails.setTimeDifference(duration.toHours() + "시간 전");
		} else {
			boardDetails.setTimeDifference(boardDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
		}

		// 댓글 날짜 포멧
		for (CommunityBoardComment b : selectBoardComment) {
			// 현재 게시글의 작성 시간을 LocalDateTime 형태로 가져오고 있습니다.
			LocalDateTime commentDate = b.getCmCommentDate();

			// 게시글의 작성 시간과 현재 시간 사이의 차이를 Duration 객체로 가져기
			Duration commentDuration = Duration.between(commentDate, now);

			// 시간의 차이를 분 단위로 변환후 diffMinutes에 저장
			long commentDiffMinutes = commentDuration.toMinutes();
			// 분기준
			if (commentDiffMinutes == 0) {
				b.setTimeDifference("방금 전");
			} else if (commentDiffMinutes < 60) {
				b.setTimeDifference(commentDiffMinutes + "분 전");

				// 하루기준
			} else if (commentDiffMinutes < 24 * 60) {
				b.setTimeDifference(commentDuration.toHours() + "시간 전");
			} else {
				b.setTimeDifference(commentDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
			}
		}

		m.addAttribute("boardDetails", boardDetails);
		m.addAttribute("totalData", totalData);
		m.addAttribute("selectBoardComment", selectBoardComment);
		m.addAttribute("pageBar",
				PageFactory.getPage(cPage, numPerpage, totalData, "boardDetails?cmBoardNo=" + cmBoardNo,"fn_paging"));
		return "/community/communityDetails";
	}

	@GetMapping("/insertBuff")
	@ResponseBody
	public int insertBuff(@RequestParam("boardNo") String boardNo, @SessionAttribute("loginMember") Member member) {
		String email = member.getEmail();
		int selectBuff = service.selectBuff(Map.of("boardNo", boardNo, "email", email));
		if (selectBuff == 0) {
			int insertBuff = service.insertBuff(Map.of("boardNo", boardNo, "email", email));
		} else {
			int removeBuff = service.removeBuff(Map.of("boardNo", boardNo, "email", email));
		}
		CommunityBoard boardDetails = service.boardDetails(boardNo);
		System.out.println(boardDetails);
		int result = boardDetails.getB();

		return result;
	}

	@GetMapping("/insertNerf")
	@ResponseBody
	public int insertNerf(@RequestParam("boardNo") String boardNo, @SessionAttribute("loginMember") Member member) {
		String email = member.getEmail();
		int selectNerf = service.selectNerf(Map.of("boardNo", boardNo, "email", email));
		if (selectNerf == 0) {
			int insertNerf = service.insertNerf(Map.of("boardNo", boardNo, "email", email));
		} else {
			int removeNerf = service.removeNerf(Map.of("boardNo", boardNo, "email", email));
		}
		CommunityBoard boardDetails = service.boardDetails(boardNo);
		int result = boardDetails.getN();

		return result;
	}

	@GetMapping("/boardModify")
	public String boardModify(@RequestParam("boardNo") String boardNo, Model m) {
		CommunityBoard boardDetails = service.boardDetails(boardNo);
		m.addAttribute("boardDetails", boardDetails);

		return "/community/modifyBoard";
	}

	@PostMapping("/updateBoard")
	public String updateBoard(@RequestParam("boardCategories") String boardCategories,
			@RequestParam("content1") String content, @RequestParam("title") String title,
			@RequestParam("video") String video, HttpSession session, @RequestParam("boardNo") int boardNo, Model m) {
		System.out.println(boardNo);
		// 유튜브주소 임베드형식으로 변경로직
		if (!video.trim().isEmpty()) { // video 파라미터가 빈 문자열이 아닐 때만 처리
			Pattern pattern = Pattern.compile(
					"(?<=v=|v\\/|\\/videos\\/|embed\\/|\\/youtu.be\\/|\\/\\/music\\.youtube\\.com\\/watch\\?v=|\\/\\/music\\.youtube\\.com\\/watch\\/\\?v=)([^#&?\\n<>]+)");
			Matcher matcher = pattern.matcher(video);
			if (matcher.find()) {
				String videoId = matcher.group(1);
				video = "https://www.youtube.com/embed/" + videoId; // 임베드 주소 형식으로 video 변수 업데이트
			}
		}

		int updateBoard = service.updateBoard(Map.of("boardCategories", boardCategories, "title", title, "video", video,
				"content", content, "boardNo", boardNo));
		if (updateBoard > 0) {
			m.addAttribute("msg", "게시글수정 완료");
			m.addAttribute("loc", "/community/selectboardList");
		} else {
			m.addAttribute("msg", "게시글수정 실패");
			m.addAttribute("loc", "/community/selectboardList");
		}
		return "common/msg";
	}

	@GetMapping("/boardRemove")
	public String boardRemove(@RequestParam("boardNo") String boardNo, Model m) {
		int boardRemove = service.boardRemove(boardNo);
		if (boardRemove > 0) {
			m.addAttribute("msg", "게시글삭제 성공");
			m.addAttribute("loc", "/community/selectboardList");
		} else {
			m.addAttribute("msg", "게시글삭제 실패");
			m.addAttribute("loc", "/community/selectboardList");
		}
		return "common/msg";
	}

	@PostMapping("/insertComment")
	@ResponseBody
	public CommunityBoardComment insertComment(@RequestParam("boardNo") String boardNo,
			@RequestParam("comment") String comment, @SessionAttribute("loginMember") Member member) {
		String email = member.getEmail();
		Map<String, Object> params = new HashMap<>();
		params.put("boardNo", boardNo);
		params.put("comment", comment);
		params.put("email", email);
		service.insertComment(params);

		String cmCommentNo = String.valueOf(params.get("cmCommentNo"));
		CommunityBoardComment selectCommentNo = service.selectCommentNo(Map.of("cmCommentNo", cmCommentNo));
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime commentDate = selectCommentNo.getCmCommentDate();

		// 게시글의 작성 시간과 현재 시간 사이의 차이를 Duration 객체로 가져오기
		Duration duration = Duration.between(commentDate, now);

		// 시간의 차이를 분 단위로 변환후 diffMinutes에 저장
		long diffMinutes = duration.toMinutes();
		// 분기준
		if (diffMinutes == 0) {
			selectCommentNo.setTimeDifference("방금 전");
		} else if (diffMinutes < 60) {
			selectCommentNo.setTimeDifference(diffMinutes + "분 전");

			// 하루기준
		} else if (diffMinutes < 24 * 60) {
			selectCommentNo.setTimeDifference(duration.toHours() + "시간 전");
		} else {
			selectCommentNo.setTimeDifference(commentDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
		}

		return selectCommentNo;
	}

	@PostMapping("/insertReply")
	@ResponseBody
	public CommunityBoardComment insertReply(@RequestParam("boardNo") String boardNo,
			@RequestParam("comment") String comment, @RequestParam("commentNo") String commentNo,
			@SessionAttribute("loginMember") Member member) {
		String email = member.getEmail();
		System.out.println(boardNo);
		System.out.println(comment);
		System.out.println(commentNo);
		service.insertReply(Map.of("boardNo", boardNo, "comment", comment, "email", email, "commentNo", commentNo));
		CommunityBoardComment selectComment = service.selectComment(commentNo);
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime boardDate = selectComment.getCmCommentDate();

		// 게시글의 작성 시간과 현재 시간 사이의 차이를 Duration 객체로 가져오기
		Duration duration = Duration.between(boardDate, now);

		// 시간의 차이를 분 단위로 변환후 diffMinutes에 저장
		long diffMinutes = duration.toMinutes();
		// 분기준
		if (diffMinutes == 0) {
			selectComment.setTimeDifference("방금 전");
		} else if (diffMinutes < 60) {
			selectComment.setTimeDifference(diffMinutes + "분 전");

			// 하루기준
		} else if (diffMinutes < 24 * 60) {
			selectComment.setTimeDifference(duration.toHours() + "시간 전");
		} else {
			selectComment.setTimeDifference(boardDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
		}

		return selectComment;

	}

	@GetMapping("/insertCb")
	@ResponseBody
	public int insertCb(@RequestParam("commentNo") String commentNo, @SessionAttribute("loginMember") Member member) {
		String email = member.getEmail();
		int selectCmBuff = service.selectCmBuff(Map.of("commentNo", commentNo, "email", email));
		if (selectCmBuff == 0) {
			int insertBuff = service.insertCmBuff(Map.of("commentNo", commentNo, "email", email));
		} else {
			int removeBuff = service.removeCmBuff(Map.of("commentNo", commentNo, "email", email));
		}
		CommunityBoardComment selectComment = service.selectComment(commentNo);

		int result = selectComment.getCb();

		return result;
	}

	@GetMapping("/insertCn")
	@ResponseBody
	public int insertCn(@RequestParam("commentNo") String commentNo, @SessionAttribute("loginMember") Member member) {
		String email = member.getEmail();
		int selectNerf = service.selectCmNerf(Map.of("commentNo", commentNo, "email", email));
		if (selectNerf == 0) {
			int insertNerf = service.insertCmNerf(Map.of("commentNo", commentNo, "email", email));
		} else {
			int removeNerf = service.removeCmNerf(Map.of("commentNo", commentNo, "email", email));
		}
		CommunityBoardComment selectComment = service.selectComment(commentNo);
		int result = selectComment.getCn();

		return result;
	}

	@PostMapping("/updateReply")
	@ResponseBody
	public CommunityBoardComment updateReply(@RequestParam("boardNo") String boardNo,
			@RequestParam("comment") String comment, @RequestParam("commentNo") String commentNo,
			@SessionAttribute("loginMember") Member member) {
		String email = member.getEmail();
		service.updateReply(Map.of("boardNo", boardNo, "comment", comment, "email", email, "commentNo", commentNo));
//		service.insertReply(Map.of("boardNo", boardNo, "comment", comment, "email", email, "commentNo", commentNo));
		CommunityBoardComment selectComment = service.selectComment(commentNo);
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime boardDate = selectComment.getCmCommentDate();

		// 게시글의 작성 시간과 현재 시간 사이의 차이를 Duration 객체로 가져오기
		Duration duration = Duration.between(boardDate, now);

		// 시간의 차이를 분 단위로 변환후 diffMinutes에 저장
		long diffMinutes = duration.toMinutes();
		// 분기준
		if (diffMinutes == 0) {
			selectComment.setTimeDifference("방금 전");
		} else if (diffMinutes < 60) {
			selectComment.setTimeDifference(diffMinutes + "분 전");

			// 하루기준
		} else if (diffMinutes < 24 * 60) {
			selectComment.setTimeDifference(duration.toHours() + "시간 전");
		} else {
			selectComment.setTimeDifference(boardDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
		}

		return selectComment;

	}

	@PostMapping("/cmRemoveBtn")
	@ResponseBody
	public int cmRemoveBtn(@RequestParam("commentNo") int commentNo, @RequestParam("boardNo") String boardNo) {
		
		int cmRemoveBtn = service.cmRemoveBtn(Map.of("commentNo", commentNo));
		return cmRemoveBtn;
	}

	@PostMapping("/memberIcon")
	@ResponseBody
	public List<MemberEmoticon> membetIcon(@SessionAttribute("loginMember") Member member) {
		String email = member.getEmail();
		List<MemberEmoticon> selectMemberIcon = service.selectMemberIcon(Map.of("email", email));
		return selectMemberIcon;
	}

	@GetMapping("/insertReport")
	public String insertReport(Model m, @RequestParam("boardNo") int boardNo) {
		Report selectReport = rservice.selectReport(boardNo);
		if (selectReport == null) {
			Map<String, Object> params = new HashMap<>();
			params.put("boardNo", boardNo);
			int result = rservice.insertReport(params);

			if (result > 0) {
				m.addAttribute("msg", "게시글신고 완료");
				m.addAttribute("loc", "/community/boardDetails?cmBoardNo=" + boardNo);
			} else {
				m.addAttribute("msg", "게시글신고 실패");
				m.addAttribute("loc", "/community/boardDetails?cmBoardNo=" + boardNo);
			}

		}
		if(selectReport!=null) {
		int reportNo =(int) selectReport.getReportNo();
		int updateReport = rservice.updateReport(Map.of("reportNo", reportNo));
		if (updateReport > 0) {
			m.addAttribute("msg", "게시글신고 완료");
			m.addAttribute("loc", "/community/boardDetails?cmBoardNo=" + boardNo);
		} else {
			m.addAttribute("msg", "게시글신고 실패");
			m.addAttribute("loc", "/community/boardDetails?cmBoardNo=" + boardNo);
		}
	}
		
		return "common/msg";
	}
	@GetMapping("/insertcmReport")
	public String insertcmReport(Model m, @RequestParam("boardCmNo") int boardCmNo,@RequestParam("boardNo") int boardNo) {
		Map<String, Object> params = new HashMap<>();
		params.put("boardCmNo", boardCmNo);
		params.put("boardNo", boardNo);
		Report selectCmReport = rservice.selectCmReport(params);
		
		if (selectCmReport == null) {
			int result = rservice.insertcmReport(params);
			if (result > 0) {
				m.addAttribute("msg", "댓글신고 완료");
				m.addAttribute("loc", "/community/boardDetails?cmBoardNo=" + boardNo);
			} else {
				m.addAttribute("msg", "댓글신고 실패");
				m.addAttribute("loc", "/community/boardDetails?cmBoardNo=" + boardNo);
			}

		}
		if(selectCmReport!=null) {
		int reportNo =(int) selectCmReport.getReportNo();
		int updateReport = rservice.updateReport(Map.of("reportNo", reportNo));
		if (updateReport > 0) {
			m.addAttribute("msg", "댓글신고 완료");
			m.addAttribute("loc", "/community/boardDetails?cmBoardNo=" + boardNo);
		} else {
			m.addAttribute("msg", "댓글신고 실패");
			m.addAttribute("loc", "/community/boardDetails?cmBoardNo=" + boardNo);
		}
	}
		return "common/msg";
	}

}
