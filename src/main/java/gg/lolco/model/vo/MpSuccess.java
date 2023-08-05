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
	
	String nickname;
	int totalPlay;
	int successPlay;
	int successPlayPercentage;
	int rownum;
	
}
