package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.Notice;

public interface NoticeDao {
	List<Notice> selectNotice(SqlSession session,Map<String, Object> param);
	List<Notice> selectCategorie(SqlSession session,Map<String, Object> param);
	Notice noticeDetails(SqlSession session,Map<String, Object> param);
	int selectNoticeCount(SqlSession session);
	int insertNotice(SqlSession session,Map<String, Object> param);
	int updateNotice(SqlSession session,Map<String, Object> param);
	int noticrRemove(SqlSession session,String boardNo);
}
