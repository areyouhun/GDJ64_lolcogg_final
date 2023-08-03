package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.CardDao;
import gg.lolco.model.vo.Card;
import gg.lolco.model.vo.MemberCard;

@Service
public class CardServiceImpl implements CardService {
	private CardDao dao;
	private SqlSession session;
	
	public CardServiceImpl(CardDao dao,SqlSession session) {
		this.dao=dao;
		this.session=session;
	}
	
	@Override
	public List<MemberCard> selectCardById(Map<String, Object> param) {
		return dao.selectCardById(session,param);
	}

	@Override
	public int selectCardCountById(String email) {
		return dao.selectCardCountById(session,email);
		
	}

	@Override
	public List<MemberCard> selectCategorie(Map<String, Object> param) {
		return dao.selectCategorie(session,param);
	}
	@Override
	public List<MemberCard> searchPlayer(Map<String, Object> param) {
		return dao.searchPlayer(session,param);
	}

	@Override
	public List<Card> selectCardName() {
		return dao.selectCardName(session);
	}

	@Override
	public int insertLeaderCaed(String type) {
		return dao.insertLeaderCaed(session,type);
	}
	@Override
	public int leaderclear() {
		return dao.leaderclear(session);
	}

	@Override
	public MemberCard selectLeaderCard(String email) {
		return dao.selectLeaderCard(session,email);
	}

	

}
