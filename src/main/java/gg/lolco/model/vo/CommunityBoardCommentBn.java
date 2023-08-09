package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommunityBoardCommentBn {
	private long bnNo;
	private String email;
	private int cmCommentNo;
	private String bNBn;
	

}
