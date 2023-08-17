package gg.lolco.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member  {
	
	private String email;
	private String password;
	private String nickname;
	private String profile;
	private String teamAbbr;
	private String titleName;
	private int totalExp;
	private int totalPoints;
	private String myReferralCode; 
	private Date enrollDate;
	private Date withdrawDate;
	private String authority;
	private String isBanned;
	private String hasDragon; 
	
	private Tier tier;
	private List<PointHistory> pointHistorys = new ArrayList(); 
	private List<Alert> alerts = new ArrayList(); //제거해야할 부분
	
}