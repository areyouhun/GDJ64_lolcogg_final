package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.WCImg;

public interface GameService {
	int worldAllCount(int num);
	
	int worldRate(int num);
	
	List<WCImg> worldcupStart(Map<String,Object> param);
	
	List<WCImg> selectWCImgAll(Map param);
	
	void winnerwinnerChickemDinner(String name);
}
