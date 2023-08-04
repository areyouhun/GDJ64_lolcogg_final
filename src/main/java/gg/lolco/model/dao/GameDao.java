package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.WCImg;

public interface GameDao {
	int worldAllCount(SqlSession session,int num);
	int worldRate(SqlSession session,int num);
	int worldRateOTO(SqlSession session,int num);
	
	List<WCImg> worldcupStart(SqlSession session,Map<String, Object> param);
	
	List<WCImg> selectWCImgAll(SqlSession session,Map param);
	
	void winnerwinnerChickemDinner(SqlSession session,String name);
	void OTOWinner(SqlSession session,String name);
}
