package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import gg.lolco.model.vo.QaBoard;

public interface QnaDao {
	
	List<QaBoard> selectQnaListAll(SqlSessionTemplate session, Map param);
	
	int selectQnaListCount(SqlSessionTemplate session);
	
}
