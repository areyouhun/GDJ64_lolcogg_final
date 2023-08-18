package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import gg.lolco.model.vo.QaBoard;

public interface MypageDao {
	
	int updateAbbrTeam(SqlSession session, Map param);
	int updateProfileImg(SqlSession session, Map param);
	int updatePasswordForProfile(SqlSession session, Map param);
	int updatePassword(SqlSession session, Map param);
	int WithdrawalEmail(SqlSession session, Map param);

}
