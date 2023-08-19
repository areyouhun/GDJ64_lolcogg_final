package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import gg.lolco.model.vo.MemberTitle;
import gg.lolco.model.vo.QaBoard;

public interface MypageDao {
	
	List<MemberTitle> selectMemberTitleListAll(SqlSession session, Map param);
	int updateAbbrTeam(SqlSession session, Map param);
	int updateProfileImg(SqlSession session, Map param);
	int updateTitle(SqlSession session, Map param);
	int updatePasswordForProfile(SqlSession session, Map param);
	int updatePassword(SqlSession session, Map param);
	int WithdrawalEmail(SqlSession session, Map param);
	int restoreEmail(SqlSession session, Map param);

}
