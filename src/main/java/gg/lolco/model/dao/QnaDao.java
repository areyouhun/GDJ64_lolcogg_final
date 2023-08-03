package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import gg.lolco.model.vo.QaBoard;
import gg.lolco.model.vo.QaBoardComment;

public interface QnaDao {
	
	List<QaBoard> selectQnaListAll(SqlSessionTemplate session, Map param);
	
	int selectQnaListCount(SqlSessionTemplate session);
	
	QaBoard qnaView(SqlSessionTemplate session, int qaNo);
	
	int insertBoard(SqlSessionTemplate session, Map param);
	
	int insertFile(SqlSessionTemplate session, Map param);
	
	int deleteQna(SqlSessionTemplate session, int qaNo);
	
	int insertComment(SqlSessionTemplate session, Map param);
	
	List<QaBoardComment> selectCommentAll(SqlSessionTemplate session, int qaNo);
}
