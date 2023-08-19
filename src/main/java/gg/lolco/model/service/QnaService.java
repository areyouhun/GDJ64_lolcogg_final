package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.MemberEmoticon;
import gg.lolco.model.vo.QaBoard;
import gg.lolco.model.vo.QaBoardComment;
import gg.lolco.model.vo.QaBoardFile;

public interface QnaService {
	
	List<QaBoard> selectQnaListAll(Map param);
	
	List<QaBoard> selectQnaListById(Map param);
	
	int selectQnaListCount();
	
	int selectQnaListCountById(String email);
	
	QaBoard qnaView(int qaNo);
	
	int insertBoard(Map param);
	
	int deleteQna(int qaNo);
	
	int insertComment(Map param);
	
	List<QaBoardComment> selectCommentAll(int qaNo);
	
	List<MemberEmoticon> myEmo(String email);
	
	int deleteComment(String qaNo);
	
	int updateBoard(Map<String,Object> param, List<QaBoardFile> files);
}
