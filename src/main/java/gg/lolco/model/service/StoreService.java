package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.CardPack;
import gg.lolco.model.vo.EmoPack;
import gg.lolco.model.vo.MemberEmoticon;
import gg.lolco.model.vo.PointItem;

public interface StoreService {
	List<PointItem> selectItemMain(int no);
	List<PointItem> selectItemDetail(Map<String,Object> param);
	List<PointItem> selectMostItem();
	
	List<EmoPack> itemPurchaseEmoticon(String name);
	List<CardPack> itemPurchaseCard(String name);
	
	String nickCkeck(String name);
	
	int nickChange(Map<String,Object> param);
	
	int buyerMoney(Map<String,Object> param);
	int itemPurchase(Map<String,Object> param);
	int memberCardBuy(Map<String,Object> param);
	int memberEmoticonBuy(Map<String,Object> param);
	int addExp(Map<String,Object> param);
	
	MemberEmoticon memberEmoticonCheck(Map<String,Object> param);
}
