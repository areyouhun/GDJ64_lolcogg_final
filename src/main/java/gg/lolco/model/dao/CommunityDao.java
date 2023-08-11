package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.CommunityBoard;
import gg.lolco.model.vo.CommunityBoardComment;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberEmoticon;

public interface CommunityDao {
	List<CommunityBoard> selectboardList(SqlSession session,Map<String, Object> param);
	List<CommunityBoard> selectBoradCategorie(SqlSession session,Map<String, Object> param);
	List<CommunityBoard> selectPopularity(SqlSession session,Map<String, Object> param);
	List<CommunityBoard> searchBoard(SqlSession session,Map<String, Object> param);
	List<CommunityBoard> realTimePopularity(SqlSession session);
	List<CommunityBoard> weeklyPopularity(SqlSession session);
	List<CommunityBoardComment> selectBoardComment(SqlSession session,Map<String, Object> param);
	List<MemberEmoticon> selectMemberIcon(SqlSession session,Map<String, Object> param);

	int readCount(SqlSession session,String cmBoardNo);
	int readDate(SqlSession session,String cmBoardNo);
	int replycut(SqlSession session,Map<String, Object> param);
	int removeReplycut(SqlSession session,Map<String, Object> param);
	int selectBoardCommentCount(SqlSession session,Map<String, Object> param);
	int deleteDate(SqlSession session);
	int boardRemove(SqlSession session,String boardNo);
	int insertCmBuff(SqlSession session,Map<String, Object> param);
	int insertBuff(SqlSession session,Map<String, Object> param);
	int insertNerf(SqlSession session,Map<String, Object> param);
	
	int insertCmNerf(SqlSession session,Map<String, Object> param);
	
	int selectCmBuff(SqlSession session,Map<String, Object> param);
	
	int selectBuff(SqlSession session,Map<String, Object> param);
	int selectNerf(SqlSession session,Map<String, Object> param);
	
	int selectCmNerf(SqlSession session,Map<String, Object> param);
	int cmRemoveBtn(SqlSession session,Map<String, Object> param);
	CommunityBoardComment selectCommentNo(SqlSession session,Map<String, Object> param);
	int removeBuff(SqlSession session,Map<String, Object> param);
	int removeCmBuff(SqlSession session,Map<String, Object> param);
	
	int removeNerf(SqlSession session,Map<String, Object> param);
	
	int removeCmNerf(SqlSession session,Map<String, Object> param);
	
	int insertComment(SqlSession session,Map<String, Object> param);
	int commentKey(SqlSession session,Map<String, Object> param);
	int insertReply(SqlSession session,Map<String, Object> param);
	int updateReply(SqlSession session,Map<String, Object> param);
	int insertCommunity(SqlSession session,Map<String, Object> param);
	int updateBoard(SqlSession session,Map<String, Object> param);
	Member selectMemberById(SqlSession session,String email);
	int selectBoardCount(SqlSession session);
	int selectBoradCategorieCount(SqlSession session,String categorie);
	int selectPopularityCount(SqlSession session,String categorie);
	int searchBoardCount(SqlSession session, Map<String, Object> param);
	CommunityBoard boardDetails(SqlSession session,String cmBoardNo);
	CommunityBoardComment selectComment(SqlSession session,String commentNo);
}
