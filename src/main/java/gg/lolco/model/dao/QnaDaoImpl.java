package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.MemberEmoticon;
import gg.lolco.model.vo.QaBoard;
import gg.lolco.model.vo.QaBoardComment;
import gg.lolco.model.vo.QaBoardFile;

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
	public List<QaBoard> selectQnaListById(SqlSessionTemplate session, Map param) {
		int cPage = (int)param.get("cPage");
		int numPerpage = (int)param.get("numPerpage");
		RowBounds rb = new RowBounds((cPage - 1)* numPerpage, numPerpage);
		return session.selectList("qna.selectQnaListById", param, rb);
	}

	@Override
	public int selectQnaListCount(SqlSessionTemplate session) {
		return session.selectOne("qna.selectQnaListCount");
	}

	@Override
	public int selectQnaListCountById(SqlSessionTemplate session, String email) {
		return session.selectOne("qna.selectQnaListCountById", email);
	}

	@Override
	public QaBoard qnaView(SqlSessionTemplate session, int qaNo) {
		return session.selectOne("qna.qnaView", qaNo);
	}

	@Override
	public int insertBoard(SqlSessionTemplate session, Map param) {
		return session.insert("qna.insertBoard", param);
	}

	@Override
	public int insertFile(SqlSessionTemplate session, QaBoardFile f) {
		return session.insert("qna.insertFile", f);
	}

	@Override
	public int deleteQna(SqlSessionTemplate session, int qaNo) {
		return session.delete("qna.deleteQna", qaNo);
	}

	@Override
	public int insertComment(SqlSessionTemplate session, Map param) {
		return session.insert("qna.insertComment", param);
	}

	@Override
	public List<QaBoardComment> selectCommentAll(SqlSessionTemplate session, int qaNo) {
		return session.selectList("qna.selectCommentAll", qaNo);
	}
	
	@Override
	public List<MemberEmoticon> myEmo(SqlSessionTemplate session, String email) {
		return session.selectList("qna.myEmo", email);
	}

	@Override
	public int deleteComment(SqlSessionTemplate session, String qaNo) {
		return session.delete("qna.deleteComment", qaNo);
	}

	@Override
	public int updateBoard(SqlSessionTemplate session, Map param) {
		return session.update("qna.updateBoard", param);
	}

	@Override
	public int deleteFile(SqlSessionTemplate session, Map param) {
		return session.delete("qna.deleteFile", param);
	}

	
	
}
