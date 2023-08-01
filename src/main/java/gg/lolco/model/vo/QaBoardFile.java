package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QaBoardFile {
	private int qaFileNo;
	private int qaNo;
	private String qaOriFilename;
	private String qaRnmFilename;
}
