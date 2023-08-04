package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.GameDao;
import gg.lolco.model.vo.WCImg;

@Service
public class GameServiceImpl implements GameService {
	private GameDao dao;
	private SqlSession session;
	
	public GameServiceImpl(GameDao dao,SqlSession session) {
		this.dao=dao;
		this.session=session;
	}

	@Override
	public int worldAllCount(int num) {
		return dao.worldAllCount(session,num);
	}
	
	@Override
	public int worldRate(int num) {
		return dao.worldRate(session,num);
	}
	
	@Override
	public List<WCImg> worldcupStart(Map<String, Object> param) {
		return dao.worldcupStart(session,param);
	}
	
	@Override
	public List<WCImg> selectWCImgAll(Map param) {
		return dao.selectWCImgAll(session,param);
	}
	
	@Override
	public void winnerwinnerChickemDinner(String name) {
		dao.winnerwinnerChickemDinner(session,name);
	}

}
