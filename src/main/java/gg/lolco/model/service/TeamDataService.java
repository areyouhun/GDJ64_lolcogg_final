package gg.lolco.model.service;

import java.util.Map;

public interface TeamDataService {

	Map<String, Object> selectTeamByAbbr(String abbr);
	
	Map<String, Object> selectPlayerByNickname(String nickname);
}
