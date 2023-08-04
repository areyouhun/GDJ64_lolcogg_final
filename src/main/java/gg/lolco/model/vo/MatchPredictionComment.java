package gg.lolco.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MatchPredictionComment {
	private long mpcNo;
	private String mpcWriter;
	private long mpcRefNo;
	private long mpcEmoNo;
	private String mpcContent;
	private Date mpcDate;
	private Date mpcUpDate;
	private MatchPredictionCommentBn matchPredictionCommentBn;
}
