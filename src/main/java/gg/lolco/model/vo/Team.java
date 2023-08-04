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
public class Team {
	private String teamAbbr;
	private String teamName;
	private int teamRank;
	private int homeRank;
	private int awayRank;
//	private int numOfMatchWins;
//	private int numOfMatchDefeats;
//	private int numOfGameWins;
//	private int numOfGameDefeats;
//	private Date updateDate;
}
