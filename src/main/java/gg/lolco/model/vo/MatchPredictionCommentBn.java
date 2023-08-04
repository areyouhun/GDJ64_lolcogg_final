package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MatchPredictionCommentBn {
	private long bnNo;
	private long bnMpcNo;
	private String bnEmail;
	private String bnBn;
}
