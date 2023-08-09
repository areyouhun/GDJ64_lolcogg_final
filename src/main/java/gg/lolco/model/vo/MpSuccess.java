package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MpSuccess {
	
	private String nickname;
	private int totalPlay;
	private int successPlay;
	private int failPlay;
	private int successPlayPercentage;
	private int rownum;
	
}
