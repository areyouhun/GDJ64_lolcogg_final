package gg.lolco.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import gg.lolco.common.interceptor.AdminChecker;
import gg.lolco.common.interceptor.LoginChecker;

@Configuration
public class LolcoggWebMvcConfig implements WebMvcConfigurer, WebSocketConfigurer {
//	private final Logger logger;
//	private final LoginChecker loginChecker;
//	private final AdminChecker adminChecker;
//	private final ChattingServer chattingServer;
//	
//	public LolcoggWebMvcConfig(Logger logger, 
//								LoginChecker loginChecker,
//								AdminChecker adminChecker,
//								ChattingServer chattingServer) 
//	{
//		this.logger = logger;
//		this.loginChecker = loginChecker;
//		this.adminChecker = adminChecker;
//		this.chattingServer = chattingServer;
//	}

	private final LoginChecker loginChecker;
	private final AdminChecker adminChecker;

	public LolcoggWebMvcConfig(LoginChecker loginChecker,
								AdminChecker adminChecker) {
		this.loginChecker = loginChecker;
		this.adminChecker = adminChecker;
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("index");
		registry.addViewController("/template").setViewName("template");
		// member ==================================================================
		registry.addViewController("/member/loginPage").setViewName("member/login");
		registry.addViewController("/member/enrollMember.do").setViewName("member/enrollMember");
		registry.addViewController("/member/mypage.do").setViewName("member/myPage");
		//=========================================================================
		registry.addViewController("/teamdata").setViewName("teamdata/teamlist");
		registry.addViewController("/qna/insertQna").setViewName("qna/insertQna");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(loggerInterceptor)
//				.addPathPatterns("");
//		
		registry.addInterceptor(loginChecker).addPathPatterns("/qna/**");

//		registry.addInterceptor(adminChecker).addPathPatterns("");
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//		registry.addHandler(chattingServer, "");
	}

}
