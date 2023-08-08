package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import gg.lolco.model.vo.MatchPrediction;
import gg.lolco.model.vo.MatchPredictionComment;
import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.MemberEmoticon;

public interface MatchPredictionDao {
	
	int playerCount(SqlSessionTemplate session);
	
	int nowWeek(SqlSessionTemplate session);
	
	List<MatchSchedule> week(SqlSessionTemplate session);
	
	List<MatchSchedule> matchScheduleByWeek(SqlSessionTemplate session, int week);
	
	List<MatchPrediction> matchMpYn(SqlSessionTemplate session);
	
	int updateMpYn(SqlSessionTemplate session);
	
	List<MatchPrediction> mpSuccess(SqlSessionTemplate session, String nickname);
	
	List<MatchPrediction> myMp(SqlSessionTemplate session, String email);
	
	int teamChoice(SqlSessionTemplate session, Map param);
	int teamChoiceDel(SqlSessionTemplate session, Map param);
	
	List<MatchPredictionComment> commentListAll(SqlSessionTemplate session, int week);
	
	List<MatchPredictionComment> bestCommentList(SqlSessionTemplate session, int week);
	
	List<MemberEmoticon> myEmo(SqlSessionTemplate session, String email);
	
	int insertComment(SqlSessionTemplate session, Map param);
	
	int deleteComment(SqlSessionTemplate session, String mpcNo);
	
	int commentBn(SqlSessionTemplate session, Map param);
	
	int commentBnDelete(SqlSessionTemplate session, Map param);
	
	MatchPredictionComment countBn(SqlSessionTemplate session, Map param);
}
