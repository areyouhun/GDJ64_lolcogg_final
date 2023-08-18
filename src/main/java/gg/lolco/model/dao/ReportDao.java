package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import gg.lolco.model.vo.Report;

public interface ReportDao {
	List<Report> reportList (SqlSession session,Map<String, Object> param);
	List<Report> reportCmList (SqlSession session,Map<String, Object> param);
	List<Report> matchpredictionCmList (SqlSession session,Map<String, Object> param);
	int reportRemove (SqlSession session,String reportNo);
	int reportListCount (SqlSession session);
	int reportCmListCount (SqlSession session);
	int matchpredictionCmListCount (SqlSession session);
	int insertReport (SqlSession session,Map<String, Object> param);
	int insertcmReport (SqlSession session,Map<String, Object> param);
	int updateReport (SqlSession session,Map<String, Object> param);
	Report selectReport (SqlSession session,int boardNo);
	Report selectCmReport (SqlSession session,Map<String, Object> param);
	Report selectMpcReport (SqlSession session, int no);
	int insertMpcReport(SqlSession session, int no);
}
