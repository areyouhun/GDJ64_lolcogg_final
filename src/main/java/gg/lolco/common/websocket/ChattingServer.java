package gg.lolco.common.websocket;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
//@Slf4j
public class ChattingServer extends TextWebSocketHandler {
	private static Map<String, WebSocketSession> clients = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) 
			throws Exception 
	{
		// TODO Auto-generated method stub
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) 
			throws Exception 
	{
		// TODO Auto-generated method stub
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) 
			throws Exception 
	{
		// TODO Auto-generated method stub
	}
}
