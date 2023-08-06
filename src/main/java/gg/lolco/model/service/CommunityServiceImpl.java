package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.CommunityDao;
import gg.lolco.model.vo.CommunityBoard;
import gg.lolco.model.vo.Member;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	private CommunityDao dao;
	private SqlSessionTemplate session;

	public CommunityServiceImpl(CommunityDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}

	@Override
	public List<CommunityBoard> selectboardList(Map<String, Object> param) {
		
		return dao.selectboardList(session,param);
	}

	@Override
	public int insertCommunity(Map<String, Object> param) {
		return dao.insertCommunity(session,param);
	}

	@Override
	public Member selectMemberById(String email) {
		return dao.selectMemberById(session,email);
	}

	@Override
	public int selectBoardCount() {
		return dao.selectBoardCount(session);
	}

	@Override
	public List<CommunityBoard> selectBoradCategorie(Map<String, Object> param) {
		return dao.selectBoradCategorie(session,param);
	}

	@Override
	public int selectBoradCategorieCount(String categorie) {
	return dao.selectBoradCategorieCount(session,categorie);
	}

	@Override
	public List<CommunityBoard> selectPopularity(Map<String, Object> param) {
		return dao.selectPopularity(session,param);
	}

	@Override
	public int selectPopularityCount(String categorie) {
		return dao.selectPopularityCount(session,categorie);
	}

	@Override
	public List<CommunityBoard> searchBoard(Map<String, Object> param) {
		return dao.searchBoard(session,param);
	}

	@Override
	public int searchBoardCount(Map<String, Object> param) {
		return dao.searchBoardCount(session,param);
	}

}
