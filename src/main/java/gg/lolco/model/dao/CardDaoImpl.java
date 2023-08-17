package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.Card;
import gg.lolco.model.vo.CardAchievementComplete;
import gg.lolco.model.vo.MemberCard;
import gg.lolco.model.vo.MemberCardAchievement;

@Repository
public class CardDaoImpl implements CardDao {

	@Override
	public List<MemberCard> selectCardById(SqlSession session,Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("card.selectCardById",param,rb);
	}



	@Override
	public int selectCardCountById(SqlSession session,String email) {
		return session.selectOne("card.selectCardCountById",email);
	}
	@Override
	public int selectCardCount(SqlSession session) {
		return session.selectOne("card.selectCardCount");
	}



	@Override
	public List<MemberCard> selectCategorie(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("card.selectCategorie",param,rb);
	}
	@Override
	public List<Card> selectCategorieAll(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		
		return session.selectList("card.selectCategorieAll",param,rb);
	}
	@Override
	public List<Card> searchPlayerAll(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		
		return session.selectList("card.searchPlayerAll",param,rb);
	}
	@Override
	public List<MemberCard> searchPlayer(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("card.searchPlayer",param,rb);
	}



	@Override
	public List<Card> selectCardName(SqlSession session) {
		return session.selectList("card.selectCardName");
	}



	@Override
	public int insertLeaderCaed(SqlSession session, String type) {
		return session.insert("card.insertLeaderCaed",type);
	}
	@Override
	public int leaderclear(SqlSession session) {
		return session.update("card.leaderclear");
	}



	@Override
	public MemberCard selectLeaderCard(SqlSession session, String email) {
		return session.selectOne("card.selectLeaderCard",email);
	}



	@Override
	public List<CardAchievementComplete> cardAchievement(SqlSession session,Map<String, Object> param) {
		return session.selectList("card.cardAchievement",param);
	}



	@Override
	public int insertCompensation(SqlSession session, Map<String, Object> param) {
		return session.insert("card.insertCompensation",param);
	}



	@Override
	public int insertAchievementById(SqlSession session, Map<String, Object> param) {
		return session.insert("card.insertAchievementById",param);
	}



	@Override
	public List<MemberCardAchievement> selectMemberAchievement(SqlSession session, Map<String, Object> param) {
		return session.selectList("card.selectMemberAchievement",param);
	}
	@Override
	public List<CardAchievementComplete> achievementUnsatisfaction(SqlSession session, Map<String, Object> param) {
		return session.selectList("card.achievementUnsatisfaction",param);
	}
	@Override
	public List<MemberCardAchievement> selectMemberAchievementAll(SqlSession session, Map<String, Object> param) {
		return session.selectList("card.selectMemberAchievementAll",param);
	}



	@Override
	public int insertPointById(SqlSession session, Map<String, Object> param) {
		return session.update("card.insertPointById",param);
	}



	@Override
	public List<CardAchievementComplete> cardAchievementAll(SqlSession session, Map<String, Object> param) {
		return session.selectList("card.cardAchievementAll",param);
	}



	@Override
	public List<MemberCard> selectCard(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("card.selectCard",param,rb);
	}



	@Override
	public int selectCategorieCount(SqlSession session, Map<String, Object> param) {
		return session.selectOne("card.selectCategorieCount",param);
	}
	
	@Override
	public int searchPlayerCount(SqlSession session, Map<String, Object> param) {
		return session.selectOne("card.searchPlayerCount",param);
	}
	@Override
	public int searchPlayerAllCount(SqlSession session, Map<String, Object> param) {
		return session.selectOne("card.searchPlayerAllCount",param);
	}
	@Override
	public int selectCategorieAllCount(SqlSession session, Map<String, Object> param) {
		return session.selectOne("card.selectCategorieAllCount",param);
	}



}
