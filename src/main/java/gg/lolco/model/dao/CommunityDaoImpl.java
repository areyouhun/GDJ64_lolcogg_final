package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.CommunityBoard;
import gg.lolco.model.vo.Member;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Override
	public List<CommunityBoard> selectboardList(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("community.selectboardList",null,rb);
	}

	@Override
	public int insertCommunity(SqlSession session, Map<String, Object> param) {
		return session.insert("community.insertCommunity",param);
	}

	@Override
	public Member selectMemberById(SqlSession session, String email) {
		return session.selectOne("community.selectMemberById",email);
	}

	@Override
	public int selectBoardCount(SqlSession session) {
		return session.selectOne("community.selectBoardCount");
	}

}
