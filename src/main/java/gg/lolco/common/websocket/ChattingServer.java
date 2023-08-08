package gg.lolco.common.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
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
	public void afterConnectionEstablished(WebSocketSession session) 
			throws Exception 
	{
		log.info("Chatting server connected");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("Data from a User: " + message.getPayload());
		
		final ChattingMessage chattingMessage = mapper.readValue(message.getPayload(), ChattingMessage.class);
		switch(chattingMessage.getType()) {
			case NOTIFICATION: 
				addClient(chattingMessage, session);
				updateUserCounts(String.valueOf(clients.size()));
				sendToOne("관리자", getClientNames());
				notify(chattingMessage.getSender() + chattingMessage.getContent());
				break;
				
			case MSG: 
				sendToAll(chattingMessage);
				break;
				
			case SHOUT:
				sendToAll(chattingMessage);
				break;
				
			case SETTINGS:
				break;
				
			case ADMIN:
				break;
		}	
	}
	
	private void addClient(ChattingMessage chattingMessage, WebSocketSession session) throws IOException {
		session.getAttributes().put("info", chattingMessage);
		clients.put(chattingMessage.getSender(), session);
		log.info("현재 접속자 수 : " + clients.size());
	}
	
	private void updateUserCounts(String count) {
		final ChattingMessage systemMessage = ChattingMessage.builder()
															.type(MessageTypes.SETTINGS)
															.content(count)
															.build();

		sendToAll(systemMessage);
	}
	
	private ChattingMessage getClientNames() {
		final String clientNames = clients.keySet()
										.stream()
										.collect(Collectors.joining(","));

		return ChattingMessage.builder()
							.type(MessageTypes.ADMIN)
							.receiver("관리자")
							.content(clientNames)
							.build();
	}
	
	private void notify(String content) throws IOException {
		final ChattingMessage systemMessage = ChattingMessage.builder()
															.type(MessageTypes.NOTIFICATION)
															.content(content)
															.build();
		
		sendToAll(systemMessage);
	}
	
	private void sendToAll(ChattingMessage chattingMessage) {
		try {
			for (Map.Entry<String, WebSocketSession> client : this.clients.entrySet()) {
				send(client.getValue(), chattingMessage);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void sendToOne(String receiver, ChattingMessage chattingMessage) {
		try {
			for (Map.Entry<String, WebSocketSession> client : this.clients.entrySet()) {
				if(isSameReceiver(client.getKey(), receiver)) {
					send(client.getValue(), chattingMessage);
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void send(WebSocketSession session, ChattingMessage chattingMessage) throws IOException {
		session.sendMessage(new TextMessage(mapper.writeValueAsString(chattingMessage)));
	}
	
	private boolean isSameReceiver(String userId, String receiver) {
		return userId.equals(receiver);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) 
			throws Exception 
	{
//		notify(((ChattingMessage) session.getAttributes().get("info")).getSender(), LEAVE_MSG);
	}
	
}
