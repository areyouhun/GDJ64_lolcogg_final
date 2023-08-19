package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.mybatis.spring.SqlSessionTemplate;

import gg.lolco.model.vo.MatchPrediction;
import gg.lolco.model.vo.MatchPredictionComment;
import gg.lolco.model.vo.MatchPredictionCommentBn;
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
	
	List<MatchPredictionComment> commentListAll(SqlSessionTemplate session, Map param);
	
	List<MatchPredictionComment> commentListAllPop(SqlSessionTemplate session, Map param);

	List<MatchPredictionComment> replyListAll(SqlSessionTemplate session);
	
	int commentCount(SqlSessionTemplate session);
	
	List<MatchPredictionComment> bestCommentList(SqlSessionTemplate session, int week);
	
	List<MemberEmoticon> myEmo(SqlSessionTemplate session, String email);
	
	int insertComment(SqlSessionTemplate session, Map param);
	
	int deleteComment(SqlSessionTemplate session, String mpcNo);
	
	int commentBn(SqlSessionTemplate session, Map param);
	
	int commentBnDelete(SqlSessionTemplate session, Map param);
	
	MatchPredictionComment countBn(SqlSessionTemplate session, Map param);
	
	List<MatchPredictionCommentBn> myBn(SqlSessionTemplate session, String email);
	
	MatchPredictionComment selectComment(SqlSessionTemplate session, Map param);
	
	int updateComment(SqlSessionTemplate session, Map param);
	
	List<MatchPrediction> mpPercentage(SqlSessionTemplate session);
	
	List<MatchPrediction> mpPercentageByNo(SqlSessionTemplate session, int choiceNo);
	
	MatchSchedule matchByNo(SqlSessionTemplate session, int choiceNo);
	
	int mpPoint(SqlSessionTemplate session, String email);
	
	List<MatchPrediction> historyEmail(SqlSessionTemplate session);
	
	int insertHistory(SqlSessionTemplate session, String email);
}
