package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import gg.lolco.model.vo.Notice;
@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<Notice> selectNotice(SqlSession session, Map<String, Object> param) {
		int cPage = (int)param.get("cPage");
		int numPerpage = (int)param.get("numPerpage");
		RowBounds rb = new RowBounds((cPage - 1)* numPerpage, numPerpage);
		return session.selectList("notice.selectNotice", null, rb);
	}

	@Override
	public int selectNoticeCount(SqlSession session) {
		return session.selectOne("notice.selectNoticeCount");
	}

	@Override
	public int insertNotice(SqlSession session, Map<String, Object> param) {
		return session.insert("notice.insertNotice",param);
	}
	@Override
	public int updateNotice(SqlSession session, Map<String, Object> param) {
		return session.insert("notice.updateNotice",param);
	}

	@Override
	public List<Notice> selectCategorie(SqlSession session, Map<String, Object> param) {
		int cPage = (int)param.get("cPage");
		int numPerpage = (int)param.get("numPerpage");
		RowBounds rb = new RowBounds((cPage - 1)* numPerpage, numPerpage);
		return session.selectList("notice.selectCategorie", param, rb);
	}

	@Override
	public Notice noticeDetails(SqlSession session, Map<String, Object> param) {
		return session.selectOne("notice.noticeDetails", param);
	}

	@Override
	public int noticrRemove(SqlSession session, String boardNo) {
		return session.delete("notice.noticrRemove", boardNo);
	}

	

	

}
