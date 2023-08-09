package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberEmoticon {
	private long meNo;
	private String meEmail;
	private long meEmoNo;
	private Emoticon emoticon;
}
