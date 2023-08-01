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
public class QaBoard {
	private int qaNo;
	private Member qaWriter;
	private String qaTitle;
	private String qaContent;
	private Date qaDate;
	private String qaPwd;
	private List<QaBoardComment> qaComment = new ArrayList();
	private List<QaBoardFile> qaFile = new ArrayList();
}
