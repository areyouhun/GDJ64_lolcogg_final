package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.MatchPrediction;
import gg.lolco.model.vo.MatchPredictionComment;
import gg.lolco.model.vo.MatchPredictionCommentBn;
import gg.lolco.model.vo.MatchSchedule;
import gg.lolco.model.vo.MemberEmoticon;

public interface MatchPredictionService {
	
	int playerCount();
	
	int nowWeek();
	
	List<MatchSchedule> week();
	
	List<MatchSchedule> matchScheduleByWeek(int week);
	
	List<MatchPrediction> matchMpYn();
	
	int updateMpYn();
	
	List<MatchPrediction> mpSuccess(String nickname);
	
	List<MatchPrediction> myMp(String email);
	
	int teamChoice(Map param);
	
	List<MatchPredictionComment> commentListAll(Map param);
	
	List<MatchPredictionComment> commentListAllPop(Map param);
	
	List<MatchPredictionComment> replyListAll();
	
	int commentCount();
	
	List<MatchPredictionComment> bestCommentList(int week);
	
	List<MemberEmoticon> myEmo(String email);
	
	int insertComment(Map param);
	
	int deleteComment(String mpcNo);
	
	int commentBn(Map param);
	
	int commentBnDelete(Map param);
	
	MatchPredictionComment countBn(Map param);
	
	List<MatchPredictionCommentBn> myBn(String email);
	
	MatchPredictionComment selectComment(Map param);
	
	int updateComment(Map param);
	
	List<MatchPrediction> mpPercentage();
	
	List<MatchPrediction> mpPercentageByNo(int choiceNo);
	
	MatchSchedule matchByNo(int choiceNo);
	
	List<MatchPrediction> historyEmail();
	
	int mpPoint(String email);
	
	int insertHistory(String email);
}
