package gg.lolco.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MatchSchedule {
	
	private long msNo;
	private String msSeason;
	private String msCategory;
	private Date msDate;
	private int msWeek;
	private String msHome;
	private String msAway;
	private int msHomeScore;
	private int msAwayScore;
//	private String msFileName;
	private String msWinner;
	
	private Team team;
}
