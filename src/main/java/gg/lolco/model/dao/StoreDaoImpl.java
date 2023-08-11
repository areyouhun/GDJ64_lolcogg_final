package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.CardPack;
import gg.lolco.model.vo.EmoPack;
import gg.lolco.model.vo.MemberEmoticon;
import gg.lolco.model.vo.PointItem;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Override
	public List<PointItem> selectItemMain(SqlSession session,int no) {
		return session.selectList("store.selectItemMain",no);
	}
	@Override
	public List<PointItem> selectItemDetail(SqlSession session,Map<String,Object> param) {
		return session.selectList("store.selectItemDetail",param);
	}
	
	@Override
	public List<EmoPack> itemPurchaseEmoticon(SqlSession session, String name) {
		return session.selectList("store.itemPurchaseEmoticon",name);
	}
	@Override
	public List<CardPack> itemPurchaseCard(SqlSession session, String name) {
		return session.selectList("store.itemPurchaseCard",name);
	}
	
	@Override
	public String nickCkeck(SqlSession session, String name) {
		return session.selectOne("store.nickCkeck",name);
	}
	
	@Override
	public int nickChange(SqlSession session, Map<String, Object> param) {
		return session.update("store.nickChange",param);
	}
	
	@Override
	public int buyerMoney(SqlSession session, Map<String, Object> param) {
		return session.update("store.buyerMoney",param);
	}
	@Override
	public int itemPurchase(SqlSession session, Map<String, Object> param) {
		return session.insert("store.itemPurchase",param);
	}
	@Override
	public int memberCardBuy(SqlSession session, Map<String, Object> param) {
		return session.insert("store.memberCardBuy",param);
	}
	@Override
	public int memberEmoticonBuy(SqlSession session, Map<String, Object> param) {
		return session.insert("store.memberEmoticonBuy",param);
	}
	@Override
	public int addExp(SqlSession session, Map<String, Object> param) {
		return session.update("store.addExp",param);
	}
	
	@Override
	public MemberEmoticon memberEmoticonCheck(SqlSession session, Map<String, Object> param) {
		return session.selectOne("store.memberEmoticonCheck",param);
	}
	
	@Override
	public List<PointItem> selectMostItem(SqlSession session) {
		return session.selectList("store.selectMostItem");
	}

}
