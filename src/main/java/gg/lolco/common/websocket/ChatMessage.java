package gg.lolco.common.websocket;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatMessage {
	private MessageTypes type;
	private String teamAbbr;
	private String senderNickname;
	private String senderEmail;
	private String receiverNickname;
	private String receiverEmail;
	private String content;
	private String voice;
	private boolean banned;
}
