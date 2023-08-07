package gg.lolco.model.service;

import java.util.List;

import gg.lolco.model.vo.CardPack;
import gg.lolco.model.vo.EmoPack;
import gg.lolco.model.vo.PointItem;

public interface StoreService {
	List<PointItem> selectItemMain(int no);
	List<PointItem> selectItemDetail(int no);
	
	List<EmoPack> itemPurchaseEmoticon(String name);
	List<CardPack> itemPurchaseCard(String name);
}
