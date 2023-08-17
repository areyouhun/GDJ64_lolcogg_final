package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.CardDao;
import gg.lolco.model.vo.Card;
import gg.lolco.model.vo.CardAchievementComplete;
import gg.lolco.model.vo.MemberCard;
import gg.lolco.model.vo.MemberCardAchievement;

@Service
public class CardServiceImpl implements CardService {
	private CardDao dao;
	private SqlSession session;
	
	public CardServiceImpl(CardDao dao,SqlSession session) {
		this.dao=dao;
		this.session=session;
	}
	
	@Override
	public List<MemberCard> selectCardById(Map<String, Object> param) {
		return dao.selectCardById(session,param);
	}

	@Override
	public int selectCardCountById(String email) {
		return dao.selectCardCountById(session,email);
		
	}
	
	@Override
	public int selectCardCount() {
		return dao.selectCardCount(session);
		
	}

	@Override
	public List<MemberCard> selectCategorie(Map<String, Object> param) {
		return dao.selectCategorie(session,param);
	}
	@Override
	public List<Card> selectCategorieAll(Map<String, Object> param) {
		return dao.selectCategorieAll(session,param);
	}
	@Override
	public List<Card> searchPlayerAll(Map<String, Object> param) {
		return dao.searchPlayerAll(session,param);
	}
	@Override
	public List<MemberCard> searchPlayer(Map<String, Object> param) {
		return dao.searchPlayer(session,param);
	}

	@Override
	public List<Card> selectCardName() {
		return dao.selectCardName(session);
	}

	@Override
	public int insertLeaderCaed(String type) {
		return dao.insertLeaderCaed(session,type);
	}
	@Override
	public int leaderclear() {
		return dao.leaderclear(session);
	}

	@Override
	public MemberCard selectLeaderCard(String email) {
		return dao.selectLeaderCard(session,email);
	}

	@Override
	public List<CardAchievementComplete> cardAchievement(Map<String,Object> param) {
		return dao.cardAchievement(session,param);
	}

	@Override
	public int insertCompensation(Map<String, Object> param) {
		return dao.insertCompensation(session,param);
	}

	@Override
	public int insertAchievementById(Map<String, Object> param) {
		return dao.insertAchievementById(session,param);
	}

	@Override
	public List<MemberCardAchievement> selectMemberAchievement(Map<String, Object> param) {
		return dao.selectMemberAchievement(session,param);
	}
	@Override
	public List<CardAchievementComplete> achievementUnsatisfaction(Map<String, Object> param) {
		return dao.achievementUnsatisfaction(session,param);
	}
	
	

	@Override
	public int insertPointById(Map<String, Object> param) {
		return dao.insertPointById(session,param);
	}

	@Override
	public List<CardAchievementComplete> cardAchievementAll(Map<String, Object> param) {
		return dao.cardAchievementAll(session,param);
	}

	@Override
	public List<MemberCard> selectCard(Map<String, Object> param) {
		return dao.selectCard(session,param);
	}

	@Override
	public int selectCategorieCount(Map<String, Object> param) {
		return dao.selectCategorieCount(session,param);
		
	}

	
	@Override
	public int searchPlayerCount(Map<String, Object> param) {
		return dao.searchPlayerCount(session,param);
		
	}
	@Override
	public int searchPlayerAllCount(Map<String, Object> param) {
		return dao.searchPlayerAllCount(session,param);
		
	}
	@Override
	public int selectCategorieAllCount(Map<String, Object> param) {
		return dao.selectCategorieAllCount(session,param);
		
	}
	
	

}
