package gg.lolco.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.CardPack;
import gg.lolco.model.vo.EmoPack;
import gg.lolco.model.vo.PointItem;

public interface StoreDao {
	List<PointItem> selectItemMain(SqlSession session,int no);
	List<PointItem> selectItemDetail(SqlSession session,int no);
	
	List<EmoPack> itemPurchaseEmoticon(SqlSession session,String name);
	List<CardPack> itemPurchaseCard(SqlSession session,String name);
}
