package gg.lolco.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import gg.lolco.common.interceptor.AdminChecker;
import gg.lolco.common.interceptor.LoginChecker;
import gg.lolco.common.websocket.ChattingServer;

@Configuration
@EnableWebSocket
public class LolcoggWebMvcConfig implements WebMvcConfigurer, WebSocketConfigurer {
	private final LoginChecker loginChecker;
	private final AdminChecker adminChecker;
	private final ChattingServer chattingServer;

	public LolcoggWebMvcConfig(LoginChecker loginChecker,
								AdminChecker adminChecker,
								ChattingServer chattingServer) {
		this.loginChecker = loginChecker;
		this.adminChecker = adminChecker;
		this.chattingServer = chattingServer;
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("index");
		registry.addViewController("/template").setViewName("template");
		// member ==================================================================
		registry.addViewController("/member/loginPage").setViewName("member/login");
		registry.addViewController("/member/enrollMember.do").setViewName("member/enrollMember");
		// mypage ==================================================================
//		registry.addViewController("/mypage/mypage.do").setViewName("mypage/myPage");
		//=========================================================================
		registry.addViewController("/teamdata").setViewName("teamdata/teamlist");
		registry.addViewController("/qna/insertQna").setViewName("qna/insertQna");
		registry.addViewController("/schedule").setViewName("calendar/schedule");
		registry.addViewController("/chat/chatroom").setViewName("chat/chatroom");
		//community ================================================================
		registry.addViewController("/community/insertCommunity").setViewName("community/insertCommunity");
		registry.addViewController("/quiz").setViewName("quiz/choiceQuiz");
		registry.addViewController("/notice/insertNotice").setViewName("notice/insertNotice");
		// admin ==================================================================
		registry.addViewController("/admin").setViewName("admin/adminList");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginChecker).addPathPatterns("/qna/**");
		registry.addInterceptor(loginChecker).addPathPatterns("/card/**");
		registry.addInterceptor(loginChecker).addPathPatterns("/community/insertCommunity");
		registry.addInterceptor(adminChecker).addPathPatterns("/admin/**");
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chattingServer, "/chatting");
	}

}
