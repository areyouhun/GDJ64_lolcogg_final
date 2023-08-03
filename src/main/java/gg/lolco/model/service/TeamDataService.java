package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

public interface TeamDataService {

	Map<String, Object> selectTeamByAbbr(String abbr);
	
	List<Map<String, Object>> selectMatchScheduleByAbbr(String abbr);
	
	List<Map<String, Object>> selectMatchHistoryByAbbr(String abbr);
	
	Map<String, Object> selectPlayerByNickname(String nickname);
	
	Map<String, Object> selectMatchResultByKeyword(Map<String, String> keyword);
}
