package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.ReportDao;
import gg.lolco.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {
	private ReportDao dao;
	private SqlSession session;
	
	public ReportServiceImpl(ReportDao dao,SqlSession session) {
		this.dao=dao;
		this.session=session;
	}

	@Override
	public List<Report> reportList(Map<String, Object> param) {
		return dao.reportList(session,param);
	}
	@Override
	public List<Report> reportCmList(Map<String, Object> param) {
		return dao.reportCmList(session,param);
	}
	@Override
	public List<Report> matchpredictionCmList(Map<String, Object> param) {
		return dao.matchpredictionCmList(session,param);
	}
	@Override
	public int reportRemove(String reportNo) {
		return dao.reportRemove(session,reportNo);
	}

	@Override
	public int reportListCount() {
		return dao.reportListCount(session);
	}
	
	@Override
	public int reportCmListCount() {
		return dao.reportCmListCount(session);
	}
	@Override
	public int matchpredictionCmListCount() {
		return dao.matchpredictionCmListCount(session);
	}

	@Override
	public int insertReport(Map<String, Object> param) {
		return dao.insertReport(session,param);
	}

	@Override
	public Report selectReport(int boardNo) {
		return dao.selectReport(session,boardNo);
	}

	@Override
	public int updateReport(Map<String, Object> param) {
		return dao.updateReport(session,param);
	}

	@Override
	public Report selectCmReport(Map<String, Object> param) {
		return dao.selectCmReport(session,param);
	}

	@Override
	public int insertcmReport(Map<String, Object> param) {
		return dao.insertcmReport(session,param);
	}

	@Override
	public Report selectMpcReport(int no) {
		return dao.selectMpcReport(session, no);
	}

	@Override
	public int insertMpcReport(int no) {
		return dao.insertMpcReport(session, no);
	}
	
	
}
