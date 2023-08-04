package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WCImg {
	private int wcImgNo;
	private int rownum;
	private String wcImgName;
	private String wcImgFilename;
	private int wcCateNo;
	private int wcWinNo;
	private int wcOTOWinNo;
}
