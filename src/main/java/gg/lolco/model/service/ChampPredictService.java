package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

public interface ChampPredictService {
	
	List<Map<String, Object>> selectMatchDate();
	
	int insertChampPredict(Map<String, String> param);
	
	int insertBanpickPredict(Map<String, String> param);
	
	List<Map<String, Object>> selectMatchData();
	
	List<String> selectMemberPredict(int no);
	
	List<Integer> selectYesterDayPredict();
	
	int updateMemberScore(Map<String, Object> param);
	
	int updatePlayYn(String email);
	
	String selectPredictYn(String email);
	
	int updateMemberPoiont();
	
	int insertPointHistory(int no);
	
}
