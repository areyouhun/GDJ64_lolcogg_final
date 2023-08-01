package gg.lolco.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.Emoticon;
import gg.lolco.model.vo.PointItem;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Override
	public List<PointItem> selectItem(SqlSession session) {
		return session.selectList("store.selectItem");
	}
	
	@Override
	public List<Emoticon> itemPurchase(SqlSession session, String name) {
		return session.selectList("store.itemPurchase",name);
	}

}
