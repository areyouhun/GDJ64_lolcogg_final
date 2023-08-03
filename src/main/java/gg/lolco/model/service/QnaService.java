package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.QaBoard;
import gg.lolco.model.vo.QaBoardComment;

public interface QnaService {
	
	List<QaBoard> selectQnaListAll(Map param);
	
	int selectQnaListCount();
	
	QaBoard qnaView(int qaNo);
	
	int insertBoard(Map param);
	
	int deleteQna(int qaNo);
	
	int insertComment(Map param);
	
	List<QaBoardComment> selectCommentAll(int qaNo);
}
