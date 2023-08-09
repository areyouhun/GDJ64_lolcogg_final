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
	
//	@Email(message = "이메일을 입력해주세요")
	private String email;
	
//	@Pattern(regexp = "(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[~!@#$%^&*()])[a-zA-Z~!@#$%^&*()]{8,}", 
//	message ="비밀번호를 입력해주세요(영대문자, 영소문자, 특수기호~!@#$%^&*()를 포함하고 8자 이상으로 작성해주세요)"  )
	private String password;
	private String nickname;
	private String profile;
	private String teamAbbr;
	private String titleName;
	private String myTier;
	private int totalExp;
	private int totalPoints;
	private String myReferralCode; 
	private Date enrollDate;
	private Date withdrawDate;
	private String authority; 

	private Tier tier;
	private List<PointHistory> pointHistorys = new ArrayList();
	private List<Alert> alerts = new ArrayList();
	
}