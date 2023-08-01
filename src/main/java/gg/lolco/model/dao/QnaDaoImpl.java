package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.QaBoard;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Override
	public List<QaBoard> selectQnaListAll(SqlSessionTemplate session, Map param) {
		int cPage = (int)param.get("cPage");
		int numPerpage = (int)param.get("numPerpage");
		RowBounds rb = new RowBounds((cPage - 1)* numPerpage, numPerpage);
		return session.selectList("qna.selectQnaListAll", null, rb);
	}

	@Override
	public int selectQnaListCount(SqlSessionTemplate session) {
		return session.selectOne("qna.selectQnaListCount");
	}

	@Override
	public QaBoard qnaView(SqlSessionTemplate session, int qaNo) {
		return session.selectOne("qna.qnaView", qaNo);
	}

	@Override
	public int insertBoard(SqlSessionTemplate session, QaBoard qb) {
		return session.insert("qna.insertBoard", qb);
	}

}
