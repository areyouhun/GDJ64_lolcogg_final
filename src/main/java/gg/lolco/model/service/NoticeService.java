package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.Notice;

public interface NoticeService {

	List<Notice> selectNotice(Map<String, Object> param);
	List<Notice> selectCategorie(Map<String, Object> param);
	Notice noticeDetails(Map<String, Object> param);
	int selectNoticeCount();
	int insertNotice(Map<String, Object> param);
	int updateNotice(Map<String, Object> param);
	int noticrRemove(String boardNo);

}
