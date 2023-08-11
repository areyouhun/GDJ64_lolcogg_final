package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.CommunityBoard;
import gg.lolco.model.vo.CommunityBoardComment;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberEmoticon;

public interface CommunityService {
	List<CommunityBoard> selectboardList(Map<String ,Object> param);
	List<CommunityBoard> selectBoradCategorie(Map<String ,Object> param);
	List<CommunityBoard> selectPopularity(Map<String ,Object> param);
	List<CommunityBoard> searchBoard(Map<String ,Object> param);
	List<CommunityBoard> realTimePopularity();
	List<CommunityBoard> weeklyPopularity();
	List<CommunityBoardComment> selectBoardComment(Map<String ,Object> param);
	List<MemberEmoticon> selectMemberIcon(Map<String ,Object> param);
	
	int insertCommunity(Map<String ,Object> param);
	int updateBoard(Map<String ,Object> param);
	int insertComment(Map<String ,Object> param);
	int replycut(Map<String ,Object> param);
	int selectBoardCommentCount(Map<String ,Object> param);
	
	int deleteDate();
	
	int commentKey(Map<String ,Object> param);
	int insertReply(Map<String ,Object> param);
	int updateReply(Map<String ,Object> param);
	int readCount(String cmBoardNo);
	int readDate(String cmBoardNo);
	int boardRemove(String boardNo);
	int insertBuff(Map<String ,Object> param);
	int insertCmBuff(Map<String ,Object> param);	
	int insertNerf(Map<String ,Object> param);
	int insertCmNerf(Map<String ,Object> param);
	int removeBuff(Map<String ,Object> param);
	int removeCmBuff(Map<String ,Object> param);
	int removeNerf(Map<String ,Object> param);
	int removeCmNerf(Map<String ,Object> param);	
	int selectBuff(Map<String ,Object> param);
	int selectCmBuff(Map<String ,Object> param);	
	int selectNerf(Map<String ,Object> param);
	int selectCmNerf(Map<String ,Object> param);
	Member selectMemberById(String email);
	int selectBoardCount();
	int selectBoradCategorieCount(String categorie);
	int selectPopularityCount(String categorie);
	int searchBoardCount(Map<String ,Object> param);
	int cmRemoveBtn(Map<String ,Object> param);
	int removeReplycut(Map<String ,Object> param);
	CommunityBoard boardDetails(String cmBoardNo);
	CommunityBoardComment selectComment(String commentKey);
	CommunityBoardComment selectCommentNo(Map<String ,Object> param);
}
