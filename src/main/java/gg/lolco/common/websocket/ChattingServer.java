package gg.lolco.common.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ChattingServer extends TextWebSocketHandler {
	private final ObjectMapper mapper;
	private final Map<String, WebSocketSession> clients;
	
	public ChattingServer(ObjectMapper mapper) {
		this.mapper = mapper;
		clients = new HashMap<>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		clients.put(session.getId(), session);
		log.info("One user has entered the chatroom");
		log.info("현재 접속자 수 : " + clients.size());
	}
	
	private void addSessionInfo(WebSocketSession session, String sender) {
		session.getAttributes().put("nickname", sender);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("Data from a User: " + message.getPayload());
		final ChatMessage chattingMessage = mapper.readValue(message.getPayload(), ChatMessage.class);
		
		switch(chattingMessage.getType()) {
			case ENTER:
				addSessionInfo(session, chattingMessage.getSender());
				
				final String notification = chattingMessage.getSender() + "님이 입장하셨습니다.";
				updateChatroom(String.valueOf(clients.size()), notification);
				break;
				
			case MSG: 
				sendToAll(chattingMessage);
				break;
				
			case SHOUT:
				sendToAll(chattingMessage);
				break;
				
			default:
				break;
		}	
	}
	
	private void updateChatroom(String userCount, String notification) {
		sendToOne("관리자", generateChatMessage(MessageTypes.ADMIN, null, null, getNicknames()));
		sendToAll(generateChatMessage(MessageTypes.COUNT, null, null, userCount));
		sendToAll(generateChatMessage(MessageTypes.NOTIFICATION, null, null, notification));
	}
	
	private String getNicknames() {
		return clients.values()
						.stream()
						.map(client -> String.valueOf(client.getAttributes().get("nickname")))
						.collect(Collectors.joining(","));
	}
	
	private void sendToAll(ChatMessage chattingMessage) {
		try {
			for (Map.Entry<String, WebSocketSession> client : clients.entrySet()) {
				send(client.getValue(), chattingMessage);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void sendToOne(String receiver, ChatMessage chattingMessage) {
		try {
			for (Map.Entry<String, WebSocketSession> client : clients.entrySet()) {
				if(isSameReceiver(client.getValue(), receiver)) {
					send(client.getValue(), chattingMessage);
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void send(WebSocketSession session, ChatMessage chattingMessage) throws IOException {
		session.sendMessage(new TextMessage(mapper.writeValueAsString(chattingMessage)));
	}
	
	private boolean isSameReceiver(WebSocketSession session, String receiver) {
		return String.valueOf(session.getAttributes().get("nickname")).equals(receiver);
	}
	
	private ChatMessage generateChatMessage(MessageTypes type, String sender, 
											String receiver, String content) 
	{
		return ChatMessage.builder()
							.type(type)
							.sender(sender)
							.receiver(receiver)
							.content(content)
							.build();
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		clients.remove(session.getId());
		log.info("One user has left the chatroom");
		log.info("현재 접속자 수 : " + clients.size());
		
		final String notification = String.valueOf(session.getAttributes().get("nickname")) + "님이 퇴장하셨습니다.";
		updateChatroom(String.valueOf(clients.size()), notification);
	}
	
}
