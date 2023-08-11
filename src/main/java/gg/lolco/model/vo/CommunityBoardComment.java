package gg.lolco.model.vo;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommunityBoardComment {
	private long cmCommentNo;
	private long cmBoardtNo;
	private int cmCommentRefNo;
	private LocalDateTime cmCommentDate;
	private String cmCommentContent;
	private Member cmCommentWriter;
	private Emoticon cmCommentEmo;
	private String timeDifference;
	private int cb;
	private int cn;
	private String cmReplycut;
	
	
	

}
