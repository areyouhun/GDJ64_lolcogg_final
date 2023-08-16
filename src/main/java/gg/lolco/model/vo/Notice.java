package gg.lolco.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notice {
	private long noticeNo;
	private Member noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int noticeReadCount ;
	private int noticeCategories;
	
}
