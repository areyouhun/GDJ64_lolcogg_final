package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.MatchPrediction;
import gg.lolco.model.vo.MatchPredictionComment;
import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.MemberEmoticon;

@Repository
public class MatchPredictionDaoImpl implements MatchPredictionDao {

	@Override
	public int playerCount(SqlSessionTemplate session) {
		return session.selectOne("matchPrediction.playerCount");
	}

	@Override
	public int nowWeek(SqlSessionTemplate session) {
		return session.selectOne("matchPrediction.nowWeek");
	}

	@Override
	public List<MatchSchedule> week(SqlSessionTemplate session) {
		return session.selectList("matchPrediction.week");
	}

	@Override
	public List<MatchSchedule> matchScheduleByWeek(SqlSessionTemplate session, int week) {
		return session.selectList("matchPrediction.matchScheduleByWeek", week);
	}

	@Override
	public List<MatchPrediction> matchMpYn(SqlSessionTemplate session) {
		return session.selectList("matchPrediction.matchMpYn");
	}

	@Override
	public int updateMpYn(SqlSessionTemplate session) {
		return session.update("matchPrediction.updateMpYn");
	}

	@Override
	public List<MatchPrediction> mpSuccess(SqlSessionTemplate session, String nickname) {
		return session.selectList("matchPrediction.mpSuccess", nickname);
	}

	@Override
	public List<MatchPrediction> myMp(SqlSessionTemplate session, String email) {
		return session.selectList("matchPrediction.myMp", email);
	}

	@Override
	public int teamChoice(SqlSessionTemplate session, Map param) {
		return session.insert("matchPrediction.teamChoice", param);
	}

	@Override
	public int teamChoiceDel(SqlSessionTemplate session, Map param) {
		return session.delete("matchPrediction.teamChoiceDel", param);
	}

	@Override
	public List<MatchPredictionComment> commentListAll(SqlSessionTemplate session, int week) {
		return session.selectList("matchPrediction.commentListAll", week);
	}

	@Override
	public List<MatchPredictionComment> bestCommentList(SqlSessionTemplate session, int week) {
		return session.selectList("matchPrediction.bestCommentList", week);
	}

	@Override
	public List<MemberEmoticon> myEmo(SqlSessionTemplate session, String email) {
		return session.selectList("matchPrediction.myEmo", email);
	}

	@Override
	public int insertComment(SqlSessionTemplate session, Map param) {
		return session.insert("matchPrediction.insertComment", param);
	}

	@Override
	public int deleteComment(SqlSessionTemplate session, String mpcNo) {
		return session.delete("matchPrediction.deleteComment", mpcNo);
	}

	@Override
	public int commentBn(SqlSessionTemplate session, Map param) {
		return session.insert("matchPrediction.commentBn", param);
	}

	@Override
	public int commentBnDelete(SqlSessionTemplate session, Map param) {
		return session.delete("matchPrediction.commentBnDelete", param);
	}

	@Override
	public MatchPredictionComment countBn(SqlSessionTemplate session, Map param) {
		return session.selectOne("matchPrediction.countBn", param);
	}

}
