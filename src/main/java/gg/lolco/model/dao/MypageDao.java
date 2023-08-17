package gg.lolco.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface MypageDao {
	
	int updateAbbrTeam(SqlSession session, Map param);
	int updateProfileImg(SqlSession session, Map param);
	int updatePasswordForProfile(SqlSession session, Map param);
}
