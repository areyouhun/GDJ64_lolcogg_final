package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.QaBoard;

public interface QnaService {
	
	List<QaBoard> selectQnaListAll(Map param);
	
	int selectQnaListCount();
	
	QaBoard qnaView(int qaNo);
	
	int insertBoard(QaBoard qb);
}
