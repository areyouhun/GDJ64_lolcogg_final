package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.MatchPrediction;
import gg.lolco.model.vo.MatchPredictionComment;
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
	
	List<MatchPredictionComment> commentListAll(int week);
	
	List<MatchPredictionComment> bestCommentList(int week);
	
	List<MemberEmoticon> myEmo(String email);
	
	int insertComment(Map param);
	
	int deleteComment(String mpcNo);
	
}
