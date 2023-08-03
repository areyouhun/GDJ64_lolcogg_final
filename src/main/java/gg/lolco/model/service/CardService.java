package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.Card;
import gg.lolco.model.vo.MemberCard;


public interface CardService {
	List<MemberCard> selectCardById(Map<String,Object> param);
	int selectCardCountById(String email);
	List<MemberCard> selectCategorie(Map<String,Object> param);
	List<MemberCard> searchPlayer(Map<String,Object> param);
	List<Card> selectCardName();
	
	
}
