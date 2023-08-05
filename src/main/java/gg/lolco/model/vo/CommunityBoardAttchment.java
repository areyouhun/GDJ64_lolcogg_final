package gg.lolco.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommunityBoardAttchment {
	private long cmAttachmentNo;
	private int cmBoardNo;
	private String cmAttachmenRenamedfilename;
}
