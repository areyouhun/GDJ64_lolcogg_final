package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Report {
   private long reportNo;
   private CommunityBoard cmBoardNo;
   private CommunityBoardComment cmCommentNo;
   private int reportCount;
   private String reportState;
   private MatchPredictionComment mpCommentno;
}
