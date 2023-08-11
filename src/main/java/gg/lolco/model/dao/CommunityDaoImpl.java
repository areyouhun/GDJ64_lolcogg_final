package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.CommunityBoard;
import gg.lolco.model.vo.CommunityBoardComment;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberEmoticon;

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
	public int updateBoard(SqlSession session, Map<String, Object> param) {
		return session.update("community.updateBoard",param);
	}

	@Override
	public Member selectMemberById(SqlSession session, String email) {
		return session.selectOne("community.selectMemberById",email);
	}

	@Override
	public int selectBoardCount(SqlSession session) {
		return session.selectOne("community.selectBoardCount");
	}

	@Override
	public List<CommunityBoard> selectBoradCategorie(SqlSession session,Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("community.selectBoradCategorie",param,rb);
	}

	@Override
	public int selectBoradCategorieCount(SqlSession session, String categorie) {
		return session.selectOne("community.selectBoradCategorieCount",categorie);
	}

	@Override
	public List<CommunityBoard> selectPopularity(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("community.selectPopularity",param,rb);
	}

	@Override
	public int selectPopularityCount(SqlSession session, String categorie) {
		return session.selectOne("community.selectPopularityCount",categorie);
	}

	@Override
	public List<CommunityBoard> searchBoard(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("community.searchBoard",param,rb);
	}

	@Override
	public int searchBoardCount(SqlSession session, Map<String, Object> param) {
		return session.selectOne("community.searchBoardCount",param);
	}

	@Override
	public CommunityBoard boardDetails(SqlSession session, String cmBoardNo) {
		return session.selectOne("community.boardDetails",cmBoardNo);
	}

	@Override
	public List<CommunityBoardComment> selectBoardComment(SqlSession session,Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("community.selectBoardComment",param,rb);
	}
	
	@Override
	public int readCount(SqlSession session,String cmBoardNo) {
		return session.update("community.readCount",cmBoardNo);
	}
	@Override
	public int readDate(SqlSession session,String cmBoardNo) {
		return session.insert("community.readDate",cmBoardNo);
	}

	@Override
	public int insertBuff(SqlSession session, Map<String, Object> param) {
		return session.insert("community.insertBuff",param);
	}

	@Override
	public int selectBuff(SqlSession session, Map<String, Object> param) {
		return session.selectOne("community.selectBuff",param);
	}

	@Override
	public int removeBuff(SqlSession session, Map<String, Object> param) {
		return session.update("community.removeBuff",param);
	}

	@Override
	public int insertNerf(SqlSession session, Map<String, Object> param) {
		return session.insert("community.insertNerf",param);
	}

	@Override
	public int selectNerf(SqlSession session, Map<String, Object> param) {
		return session.selectOne("community.selectNerf",param);
	}

	@Override
	public int removeNerf(SqlSession session, Map<String, Object> param) {
		return session.update("community.removeNerf",param);
	}

	@Override
	public int boardRemove(SqlSession session, String boardNo) {
		return session.update("community.boardRemove",boardNo);
	}

	@Override
	public int insertComment(SqlSession session, Map<String, Object> param) {
		return session.insert("community.insertComment",param);
	}
	@Override
	public int commentKey(SqlSession session, Map<String, Object> param) {
		return session.selectOne("community.commentKey",param);
	}
	@Override
	public int insertReply(SqlSession session, Map<String, Object> param) {
		return session.insert("community.insertReply",param);
	}
	@Override
	public int updateReply(SqlSession session, Map<String, Object> param) {
		return session.update("community.updateReply",param);
	}

	@Override
	public CommunityBoardComment selectComment(SqlSession session,String commentNo) {
		return session.selectOne("community.selectComment",commentNo);
	}

	@Override
	public int insertCmBuff(SqlSession session, Map<String, Object> param) {
		return session.insert("community.insertCmBuff",param);
	}

	@Override
	public int selectCmBuff(SqlSession session, Map<String, Object> param) {
		return session.selectOne("community.selectCmBuff",param);
	}

	@Override
	public int removeCmBuff(SqlSession session, Map<String, Object> param) {
		return session.update("community.removeCmBuff",param);
	}

	@Override
	public int insertCmNerf(SqlSession session, Map<String, Object> param) {
		return session.insert("community.insertCmNerf",param);
	}

	@Override
	public int selectCmNerf(SqlSession session, Map<String, Object> param) {
		return session.selectOne("community.selectCmNerf",param);
	}

	@Override
	public int removeCmNerf(SqlSession session, Map<String, Object> param) {
		return session.update("community.removeCmNerf",param);
	}

	@Override
	public CommunityBoardComment selectCommentNo(SqlSession session, Map<String, Object> param) {
		return session.selectOne("community.selectCommentNo",param);
	}

	@Override
	public int cmRemoveBtn(SqlSession session, Map<String, Object> param) {
		return session.update("community.cmRemoveBtn",param);
	}

	@Override
	public int selectBoardCommentCount(SqlSession session, Map<String, Object> param) {
		return session.selectOne("community.selectBoardCommentCount",param);
	}

	@Override
	public List<MemberEmoticon> selectMemberIcon(SqlSession session, Map<String, Object> param) {
		return session.selectList("community.selectMemberIcon",param);
	}

	@Override
	public int replycut(SqlSession session, Map<String, Object> param) {
		return session.update("community.replycut",param);
	}

	@Override
	public int removeReplycut(SqlSession session, Map<String, Object> param) {
		return session.update("community.removeReplycut",param);
	}

	@Override
	public List<CommunityBoard> realTimePopularity(SqlSession session) {
		return session.selectList("community.realTimePopularity");
	}
	@Override
	public List<CommunityBoard> weeklyPopularity(SqlSession session) {
		return session.selectList("community.weeklyPopularity");
	}

	@Override
	public int deleteDate(SqlSession session) {
		return session.delete("community.deleteDate");
	}

}
