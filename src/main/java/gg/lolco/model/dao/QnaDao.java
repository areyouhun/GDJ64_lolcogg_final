package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import gg.lolco.model.vo.MemberEmoticon;
import gg.lolco.model.vo.QaBoard;
import gg.lolco.model.vo.QaBoardComment;
import gg.lolco.model.vo.QaBoardFile;

public interface QnaDao {
	
	List<QaBoard> selectQnaListAll(SqlSessionTemplate session, Map param);
	
	List<QaBoard> selectQnaListById(SqlSessionTemplate session, Map param);
	
	int selectQnaListCount(SqlSessionTemplate session);
	
	int selectQnaListCountById(SqlSessionTemplate session, String email);
	
	QaBoard qnaView(SqlSessionTemplate session, int qaNo);
	
	int insertBoard(SqlSessionTemplate session, Map param);
	
	int insertFile(SqlSessionTemplate session, QaBoardFile f);
	
	int deleteQna(SqlSessionTemplate session, int qaNo);
	
	int insertComment(SqlSessionTemplate session, Map param);
	
	List<QaBoardComment> selectCommentAll(SqlSessionTemplate session, int qaNo);
	
	List<MemberEmoticon> myEmo(SqlSessionTemplate session, String email);
	
	int deleteComment(SqlSessionTemplate session, String qaNo);
	
	int updateBoard(SqlSessionTemplate session, Map param);
	
	int deleteFile(SqlSessionTemplate session, Map param);
}
