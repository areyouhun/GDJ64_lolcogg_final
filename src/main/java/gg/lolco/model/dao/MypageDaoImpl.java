package gg.lolco.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public int updateAbbrTeam(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("mypage.updateAbbrTeam", param);
	}

	@Override
	public int updateProfileImg(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("mypage.updateProfileImg", param);
	}

	@Override
	public int updatePasswordForProfile(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("mypage.updatePasswordForProfile", param);
	}
	
}
