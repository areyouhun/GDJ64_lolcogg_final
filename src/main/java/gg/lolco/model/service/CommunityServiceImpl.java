package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.CommunityDao;
import gg.lolco.model.vo.CommunityBoard;
import gg.lolco.model.vo.CommunityBoardComment;
import gg.lolco.model.vo.Member;
import gg.lolco.model.vo.MemberEmoticon;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	private CommunityDao dao;
	private SqlSessionTemplate session;

	public CommunityServiceImpl(CommunityDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}

	@Override
	public List<CommunityBoard> selectboardList(Map<String, Object> param) {
		
		return dao.selectboardList(session,param);
	}

	@Override
	public int insertCommunity(Map<String, Object> param) {
		return dao.insertCommunity(session,param);
	}
	@Override
	public int updateBoard(Map<String, Object> param) {
		return dao.updateBoard(session,param);
	}

	@Override
	public Member selectMemberById(String email) {
		return dao.selectMemberById(session,email);
	}

	@Override
	public int selectBoardCount() {
		return dao.selectBoardCount(session);
	}

	@Override
	public List<CommunityBoard> selectBoradCategorie(Map<String, Object> param) {
		return dao.selectBoradCategorie(session,param);
	}

	@Override
	public int selectBoradCategorieCount(String categorie) {
	return dao.selectBoradCategorieCount(session,categorie);
	}

	@Override
	public List<CommunityBoard> selectPopularity(Map<String, Object> param) {
		return dao.selectPopularity(session,param);
	}

	@Override
	public int selectPopularityCount(String categorie) {
		return dao.selectPopularityCount(session,categorie);
	}

	@Override
	public List<CommunityBoard> searchBoard(Map<String, Object> param) {
		return dao.searchBoard(session,param);
	}
	@Override
	public List<CommunityBoard> realTimePopularity() {
		return dao.realTimePopularity(session);
	}
	@Override
	public List<CommunityBoard> weeklyPopularity() {
		return dao.weeklyPopularity(session);
	}

	@Override
	public int searchBoardCount(Map<String, Object> param) {
		return dao.searchBoardCount(session,param);
	}

	@Override
	public CommunityBoard boardDetails(String cmBoardNo) {
		return dao.boardDetails(session,cmBoardNo);
	}

	@Override
	public List<CommunityBoardComment> selectBoardComment(Map<String, Object> param) {
		return dao.selectBoardComment(session,param);
	}

	@Override
	public int readCount(String cmBoardNo) {
		return dao.readCount(session,cmBoardNo);
	}
	@Override
	public int readDate(String cmBoardNo) {
		return dao.readDate(session,cmBoardNo);
	}

	@Override
	public int insertBuff(Map<String ,Object> param) {
		return dao.insertBuff(session,param);
	}

	@Override
	public int selectBuff(Map<String, Object> param) {
		return dao.selectBuff(session,param);
	}

	@Override
	public int removeBuff(Map<String, Object> param) {
		return dao.removeBuff(session,param);
	}

	@Override
	public int insertNerf(Map<String, Object> param) {
		return dao.insertNerf(session,param);
	}

	@Override
	public int removeNerf(Map<String, Object> param) {
		return dao.removeNerf(session,param);
	}

	@Override
	public int selectNerf(Map<String, Object> param) {
		return dao.selectNerf(session,param);
	}

	@Override
	public int boardRemove(String boardNo) {
		return dao.boardRemove(session,boardNo);
	}

	@Override
	public int insertComment(Map<String, Object> param) {
			return dao.insertComment(session,param);		
	}
	@Override
	public int commentKey(Map<String, Object> param) {
		return dao.commentKey(session,param);
	}
	@Override
	public int insertReply(Map<String, Object> param) {
		return dao.insertReply(session,param);
	}
	@Override
	public int updateReply(Map<String, Object> param) {
		return dao.updateReply(session,param);
	}

	@Override
	public CommunityBoardComment selectComment(String commentNo) {
		return dao.selectComment(session,commentNo);
	}
	@Override
	public CommunityBoardComment selectCommentNo(Map<String, Object> param) {
		return dao.selectCommentNo(session,param);
	}

	@Override
	public int insertCmBuff(Map<String, Object> param) {
		return dao.insertCmBuff(session,param);
	}

	@Override
	public int removeCmBuff(Map<String, Object> param) {
		return dao.removeCmBuff(session,param);
	}

	@Override
	public int selectCmBuff(Map<String, Object> param) {
		return dao.selectCmBuff(session,param);
	}

	@Override
	public int insertCmNerf(Map<String, Object> param) {
		return dao.insertCmNerf(session,param);
	}

	@Override
	public int removeCmNerf(Map<String, Object> param) {
		return dao.removeCmNerf(session,param);
	}

	@Override
	public int selectCmNerf(Map<String, Object> param) {
		return dao.selectCmNerf(session,param);
	}

	@Override
	public int cmRemoveBtn(Map<String, Object> param) {
		return dao.cmRemoveBtn(session,param);
	}

	@Override
	public int selectBoardCommentCount(Map<String, Object> param) {
		return dao.selectBoardCommentCount(session,param);
	}
	
	@Override
	public int deleteDate() {
		return dao.deleteDate(session);
	}

	@Override
	public List<MemberEmoticon> selectMemberIcon(Map<String, Object> param) {
		return dao.selectMemberIcon(session,param);
	}

	@Override
	public int replycut(Map<String, Object> param) {
		return dao.replycut(session,param);
	}

	@Override
	public int removeReplycut(Map<String, Object> param) {
		return dao.removeReplycut(session,param);
	}

	

}
