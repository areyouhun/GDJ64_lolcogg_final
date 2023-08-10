package gg.lolco.model.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MatchPrediction {
	private long mpNo;
	private String mpEmail;
	private String mpTeam;
	private String mpYn;
	private int mpMsNo;
	
	private int count;
	private List<MatchPredictionComment> matchPredictionComment = new ArrayList<>();
	private MatchSchedule matchSchedule;
}
