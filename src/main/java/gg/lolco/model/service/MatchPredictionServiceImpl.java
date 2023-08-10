package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.MatchPredictionDao;
import gg.lolco.model.vo.MatchPrediction;
import gg.lolco.model.vo.MatchPredictionComment;
import gg.lolco.model.vo.MatchPredictionCommentBn;
import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.MemberEmoticon;

@Service
public class MatchPredictionServiceImpl implements MatchPredictionService {
	
	private MatchPredictionDao dao;
	private SqlSessionTemplate session;

	public MatchPredictionServiceImpl(MatchPredictionDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public int playerCount() {
		return dao.playerCount(session);
	}

	@Override
	public int nowWeek() {
		return dao.nowWeek(session);
	}

	@Override
	public List<MatchSchedule> week() {
		return dao.week(session);
	}

	@Override
	public List<MatchSchedule> matchScheduleByWeek(int week) {
		return dao.matchScheduleByWeek(session, week);
	}

	@Override
	public List<MatchPrediction> matchMpYn() {
		return dao.matchMpYn(session);
	}

	@Override
	public int updateMpYn() {
		return dao.updateMpYn(session);
	}

	@Override
	public List<MatchPrediction> mpSuccess(String nickname) {
		return dao.mpSuccess(session, nickname);
	}

	@Override
	public List<MatchPrediction> myMp(String email) {
		return dao.myMp(session, email);
	}

	@Override
	public int teamChoice(Map param) {
		int result = dao.teamChoiceDel(session, param);
		result += dao.teamChoice(session, param);
		return result;
	}

	@Override
	public List<MatchPredictionComment> commentListAll(int week) {
		return dao.commentListAll(session, week);
	}

	@Override
	public List<MatchPredictionComment> bestCommentList(int week) {
		return dao.bestCommentList(session, week);
	}

	@Override
	public List<MemberEmoticon> myEmo(String email) {
		return dao.myEmo(session, email);
	}

	@Override
	public int insertComment(Map param) {
		return dao.insertComment(session, param);
	}

	@Override
	public int deleteComment(String mpcNo) {
		return dao.deleteComment(session, mpcNo);
	}

	@Override
	public int commentBn(Map param) {
		return dao.commentBn(session, param);
	}

	@Override
	public int commentBnDelete(Map param) {
		return dao.commentBnDelete(session, param);
	}

	@Override
	public MatchPredictionComment countBn(Map param) {
		return dao.countBn(session, param);
	}

	@Override
	public List<MatchPredictionCommentBn> myBn(String email) {
		return dao.myBn(session, email);
	}

	@Override
	public MatchPredictionComment selectComment(Map param) {
		return dao.selectComment(session, param);
	}

	@Override
	public int updateComment(Map param) {
		return dao.updateComment(session, param);
	}

	@Override
	public List<MatchPrediction> mpPercentage() {
		return dao.mpPercentage(session);
	}
	
}
