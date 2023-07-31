package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.QnaDao;
import gg.lolco.model.vo.QaBoard;

@Service
public class QnaServiceImpl implements QnaService {

	private QnaDao dao;
	private SqlSessionTemplate session;
	
	public QnaServiceImpl(QnaDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<QaBoard> selectQnaListAll(Map param) {
		return dao.selectQnaListAll(session, param);
	}

	@Override
	public int selectQnaListCount() {
		return dao.selectQnaListCount(session);
	}

}
