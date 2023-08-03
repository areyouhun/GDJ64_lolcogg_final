package gg.lolco.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QaBoardComment {
	private int qaCommentNo;
	private int qaNo;
	private Member qaCommentWriter;
	private String qaCommentContent;
	private Date qaCommentDate;
}
