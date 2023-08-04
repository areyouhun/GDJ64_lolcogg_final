package gg.lolco.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class PointHistory {

	private int pointHistroyNo;
	private String email;
	private PointCategory phCategory;
	private String phComment;
	private int phPoint;
	private Date phDate;
	
}
