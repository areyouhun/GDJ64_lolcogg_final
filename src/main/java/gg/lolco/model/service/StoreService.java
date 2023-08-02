package gg.lolco.model.service;

import java.util.List;

import gg.lolco.model.vo.Emoticon;
import gg.lolco.model.vo.PointItem;

public interface StoreService {
	List<PointItem> selectItem();
	
	List<Emoticon> itemPurchase(String name);
}
