package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

public interface TeamDataService {

	Map<String, Object> selectTeamByAbbr(String abbr);
	
	List<Map<String, Object>> selectMatchByAbbr(String abbr);
	
	Map<String, Object> selectPlayerByNickname(String nickname);
}
