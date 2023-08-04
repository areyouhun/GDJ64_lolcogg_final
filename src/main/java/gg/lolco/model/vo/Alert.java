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
public class Alert {

	private int alertNo;
	private String email;
	private String alertContent;
	private Date alertDate;
	private String alertYn;
	
}
