package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PointItem {
	private String itemNo;
	private String itemName;
	private int itemPrice;
	private String itemExp;
	private int itemCateNo;
	private String itemFilename;
}
