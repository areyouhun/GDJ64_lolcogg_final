package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.Card;
import gg.lolco.model.vo.MemberCard;

public interface CardDao {
	List<MemberCard> selectCardById(SqlSession session,Map<String, Object> param);
	int selectCardCountById(SqlSession session,String email);
	List<MemberCard> selectCategorie(SqlSession session,Map<String, Object> param);
	List<MemberCard> searchPlayer(SqlSession session,Map<String, Object> param);
	List<Card> selectCardName(SqlSession session);

}
