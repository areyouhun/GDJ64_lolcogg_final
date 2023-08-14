package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CardAchievementComplete {
	private long caCompleteNo;
	private Card cardNo;
	private CardAchievement achievement;
	private Title titleNo;
	private int compensation;
}