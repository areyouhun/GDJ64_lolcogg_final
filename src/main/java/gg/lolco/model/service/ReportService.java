package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.Report;

public interface ReportService {
	List<Report> reportList(Map<String, Object> param);
	List<Report> reportCmList(Map<String, Object> param);
	List<Report> matchpredictionCmList(Map<String, Object> param);
	int reportRemove(String reportNo);
	int reportListCount();
	int reportCmListCount();
	int matchpredictionCmListCount();
	int insertReport(Map<String, Object> param);
	int insertcmReport(Map<String, Object> param);
	int updateReport(Map<String, Object> param);
	Report selectReport(int boardNo);
	Report selectCmReport(Map<String, Object> param);
	Report selectMpcReport(int no);
	int insertMpcReport(int no);
}
