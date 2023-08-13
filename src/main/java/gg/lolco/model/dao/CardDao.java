package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.Card;
import gg.lolco.model.vo.CardAchievementComplete;
import gg.lolco.model.vo.MemberCard;
import gg.lolco.model.vo.MemberCardAchievement;

public interface CardDao {
	List<MemberCard> selectCardById(SqlSession session,Map<String, Object> param);
	int selectCardCountById(SqlSession session,String email);
	List<MemberCard> selectCategorie(SqlSession session,Map<String, Object> param);
	List<MemberCard> searchPlayer(SqlSession session,Map<String, Object> param);
	List<Card> selectCardName(SqlSession session);
	List<CardAchievementComplete> cardAchievement(SqlSession session,Map<String, Object> param);
	List<CardAchievementComplete> cardAchievementAll(SqlSession session,Map<String, Object> param);
	List<MemberCardAchievement> selectMemberAchievement(SqlSession session,Map<String, Object> param);
	List<CardAchievementComplete> achievementUnsatisfaction(SqlSession session,Map<String, Object> param);
	List<MemberCardAchievement> selectMemberAchievementAll(SqlSession session,Map<String, Object> param);
	int insertLeaderCaed(SqlSession session,String type);
	int insertPointById(SqlSession session,Map<String, Object> param);
	int leaderclear(SqlSession session);
	int insertCompensation(SqlSession session,Map<String, Object> param);
	int insertAchievementById(SqlSession session,Map<String, Object> param);
	MemberCard selectLeaderCard(SqlSession session,String email);
	
}
