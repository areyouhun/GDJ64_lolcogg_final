package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

public interface SchedulerService {
	
	int updatePlayerFile(List<Map<String, String>> param);

	int updateMatchFile(List<Map<String, String>> param);

	int updateTeamRanking(List<Map<String, String>> param);
	
	int updateRegionalMatch(List<Map<String, String>> param);
	
	int updateMatchTeam(List<Map<String, String>> param);
	
}
