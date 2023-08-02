package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.WCImg;

public interface GameDao {
	int worldAllCount(SqlSession session,int no);
	
	List<WCImg> worldcupStart(SqlSession session,Map<String, Object> param);
}
