package gg.lolco.model.vo;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommunityBn {
	private long communityBnNo;
	private String communityEmail;
	private int communityCmBoardNo;
	private String communityBnBn;
}
