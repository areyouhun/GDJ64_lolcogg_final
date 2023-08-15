package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.NoticeDao;
import gg.lolco.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	private NoticeDao dao;
	private SqlSessionTemplate session;
	
	
	public NoticeServiceImpl(NoticeDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<Notice> selectNotice(Map<String, Object> param) {
		return dao.selectNotice(session,param);
	}

	@Override
	public int selectNoticeCount() {
		return dao.selectNoticeCount(session);
	}

	@Override
	public int insertNotice(Map<String, Object> param) {
		return dao.insertNotice(session,param);
	}
	@Override
	public int updateNotice(Map<String, Object> param) {
		return dao.updateNotice(session,param);
	}

	@Override
	public List<Notice> selectCategorie(Map<String, Object> param) {
		return dao.selectCategorie(session,param);
	}

	@Override
	public Notice noticeDetails(Map<String, Object> param) {
		return dao.noticeDetails(session,param);
	}

	@Override
	public int noticrRemove(String boardNo) {
		return dao.noticrRemove(session,boardNo);
	}
	
}
