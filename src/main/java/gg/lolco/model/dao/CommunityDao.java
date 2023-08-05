package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.CommunityBoard;
import gg.lolco.model.vo.Member;

public interface CommunityDao {
	List<CommunityBoard> selectboardList(SqlSession session,Map<String, Object> param);
	int insertCommunity(SqlSession session,Map<String, Object> param);
	Member selectMemberById(SqlSession session,String email);
	int selectBoardCount(SqlSession session);
}
