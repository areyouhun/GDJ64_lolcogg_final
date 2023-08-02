package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.WCImg;

@Repository
public class GameDaoImpl implements GameDao {

	@Override
	public int worldAllCount(SqlSession session, int no) {
		return session.selectOne("game.worldAllCount",no);
	}
	
	@Override
	public List<WCImg> worldcupStart(SqlSession session, Map<String, Object> param) {
		return session.selectList("game.worldcupStart",param);
	}

}
