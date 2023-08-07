package gg.lolco.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.CardPack;
import gg.lolco.model.vo.EmoPack;
import gg.lolco.model.vo.Emoticon;
import gg.lolco.model.vo.PointItem;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Override
	public List<PointItem> selectItemMain(SqlSession session,int no) {
		return session.selectList("store.selectItemMain",no);
	}
	@Override
	public List<PointItem> selectItemDetail(SqlSession session,int no) {
		return session.selectList("store.selectItemDetail",no);
	}
	
	@Override
	public List<EmoPack> itemPurchaseEmoticon(SqlSession session, String name) {
		return session.selectList("store.itemPurchaseEmoticon",name);
	}
	@Override
	public List<CardPack> itemPurchaseCard(SqlSession session, String name) {
		return session.selectList("store.itemPurchaseCard",name);
	}

}
