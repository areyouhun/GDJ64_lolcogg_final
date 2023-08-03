package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Card {
	private long cardNo;
	private CardClass cardClass;
	private String teamName;
	private String cardName;
	private String cardSeason;
	private int cardBattleAbility;
	private int cardDefendAbility;
	private int cardAssistantAbility;
	private int cardsurvivalAbility;
	private int cardGrowthAbility;
	private String cardPosition;
	
}
