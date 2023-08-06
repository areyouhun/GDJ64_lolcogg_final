package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.CommunityBoard;
import gg.lolco.model.vo.Member;

public interface CommunityService {
	List<CommunityBoard> selectboardList(Map<String ,Object> param);
	List<CommunityBoard> selectBoradCategorie(Map<String ,Object> param);
	List<CommunityBoard> selectPopularity(Map<String ,Object> param);
	List<CommunityBoard> searchBoard(Map<String ,Object> param);
	int insertCommunity(Map<String ,Object> param);
	Member selectMemberById(String email);
	int selectBoardCount();
	int selectBoradCategorieCount(String categorie);
	int selectPopularityCount(String categorie);
	int searchBoardCount(Map<String ,Object> param);
}
