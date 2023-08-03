package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.Card;
import gg.lolco.model.vo.MemberCard;

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
	public List<MemberCard> selectCategorie(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
	
		return session.selectList("card.selectCategorie",param,rb);
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



}
