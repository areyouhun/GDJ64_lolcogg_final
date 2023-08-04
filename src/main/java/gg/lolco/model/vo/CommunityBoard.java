package gg.lolco.model.vo;

import java.sql.Date;
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
	private Date cmBoardDate;
	private int cmBoardReadCount;
	
}
