package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.WCImg;

@Repository
public class GameDaoImpl implements GameDao {

	@Override
	public int worldAllCount(SqlSession session, int num) {
		return session.selectOne("game.worldAllCount",num);
	}
	
	@Override
	public int worldRate(SqlSession session, int num) {
		return session.selectOne("game.worldRate",num);
	}
	@Override
	public int worldRateOTO(SqlSession session, int num) {
		return session.selectOne("game.worldRateOTO",num);
	}
	
	@Override
	public List<WCImg> worldcupStart(SqlSession session, Map<String, Object> param) {
		return session.selectList("game.worldcupStart",param);
	}
	
	@Override
	public List<WCImg> selectWCImgAll(SqlSession session, Map param) {
		int cPage = (int)param.get("cPage");
		int numPerpage = (int)param.get("numPerpage");
		RowBounds rb = new RowBounds((cPage - 1)* numPerpage, numPerpage);
		return session.selectList("game.selectWCImgAll",param.get("num"),rb);
	}
	
	@Override
	public void winnerwinnerChickemDinner(SqlSession session, String name) {
		session.update("game.winnerwinnerChickemDinner",name);
	}
	
	@Override
	public void OTOWinner(SqlSession session, String name) {
		session.update("game.OTOWinner",name);
	}

}
