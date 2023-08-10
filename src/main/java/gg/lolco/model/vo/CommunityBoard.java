package gg.lolco.model.vo;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommunityBoard {
	private long cmBoardNo;
	private Member cmBoardWriter;
	private String cmBoardTitle;
	private String cmBoardContent;
	//DATE는 시간을을 안가져오기에 LocalDateTime타입
	private LocalDateTime cmBoardDate;
	private int cmBoardReadCount;
	private String cmBoardCategories;
	private String cmVideoAddress;
	private int replycut;
	private int b;
	private int n;
	private int c;
	private String timeDifference;
	private List<CommunityBoardComment> cmBoardComment = new ArrayList();
}
	
