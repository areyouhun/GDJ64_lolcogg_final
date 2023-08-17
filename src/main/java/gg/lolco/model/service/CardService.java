package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.Card;
import gg.lolco.model.vo.CardAchievementComplete;
import gg.lolco.model.vo.MemberCard;
import gg.lolco.model.vo.MemberCardAchievement;


public interface CardService {
	List<MemberCard> selectCardById(Map<String,Object> param);
	int selectCardCountById(String email);
	int selectCardCount();
	int selectCategorieCount(Map<String,Object> param);
	int searchPlayerCount(Map<String,Object> param);
	int searchPlayerAllCount(Map<String,Object> param);
	int selectCategorieAllCount(Map<String,Object> param);
	List<MemberCard> selectCategorie(Map<String,Object> param);
	List<Card> selectCategorieAll(Map<String,Object> param);
	List<Card> searchPlayerAll(Map<String,Object> param);
	List<MemberCard> searchPlayer(Map<String,Object> param);
	List<MemberCard> selectCard(Map<String,Object> param);
	List<Card> selectCardName();
	List<CardAchievementComplete> cardAchievement(Map<String,Object> param);
	List<MemberCardAchievement> selectMemberAchievement(Map<String,Object> param);
	List<CardAchievementComplete> achievementUnsatisfaction(Map<String,Object> param);
	List<CardAchievementComplete> cardAchievementAll(Map<String,Object> param);
	int insertLeaderCaed(String type);
	int insertCompensation(Map<String,Object> param);
	int insertAchievementById(Map<String,Object> param);
	int insertPointById(Map<String,Object> param);
	int leaderclear();
	MemberCard 	selectLeaderCard(String email);
	
	
	
}
