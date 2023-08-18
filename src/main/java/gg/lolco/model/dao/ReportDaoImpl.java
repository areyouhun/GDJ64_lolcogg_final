package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.lolco.model.vo.Report;

@Repository
public class ReportDaoImpl implements ReportDao {

	@Override
	public List<Report> reportList(SqlSession session,Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("report.reportList",null,rb);
	}
	@Override
	public int reportRemove(SqlSession session,String reportNo) {
		return session.update("report.reportRemove",reportNo);
	}
	@Override
	public int reportListCount(SqlSession session) {
		return session.selectOne("report.reportListCount");
	}
	@Override
	public List<Report> reportCmList(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("report.reportCmList",null,rb);
	}
	@Override
	public List<Report> matchpredictionCmList(SqlSession session, Map<String, Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("report.matchpredictionCmList",null,rb);
	}
	@Override
	public int reportCmListCount(SqlSession session) {
		return session.selectOne("report.reportCmListCount");
	}
	@Override
	public int matchpredictionCmListCount(SqlSession session) {
		return session.selectOne("report.matchpredictionCmListCount");
	}
	@Override
	public int insertReport(SqlSession session,Map<String, Object> param) {
		return session.insert("report.insertReport",param);
	}
	@Override
	public Report selectReport(SqlSession session, int boardNo) {
		return session.selectOne("report.selectReport",boardNo);
	}
	@Override
	public int updateReport(SqlSession session, Map<String, Object> param) {
		return session.update("report.updateReport",param);
	}
	@Override
	public Report selectCmReport(SqlSession session, Map<String, Object> param) {
		return session.selectOne("report.selectCmReport",param);
	}
	@Override
	public int insertcmReport(SqlSession session, Map<String, Object> param) {
		return session.insert("report.insertcmReport",param);
	}
	@Override
	public Report selectMpcReport(SqlSession session, int no) {
		return session.selectOne("report.selectMpcReport", no);
	}
	@Override
	public int insertMpcReport(SqlSession session, int no) {
		return session.insert("report.insertMpcReport", no);
	}

}
