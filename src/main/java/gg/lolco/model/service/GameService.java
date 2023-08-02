package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.WCImg;

public interface GameService {
	int worldAllCount(int no);
	
	List<WCImg> worldcupStart(Map<String,Object> param);
}
