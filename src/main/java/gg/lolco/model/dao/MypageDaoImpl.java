package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import gg.lolco.model.vo.MemberTitle;
import gg.lolco.model.vo.QaBoard;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public List<MemberTitle> selectMemberTitleListAll(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("mypage.selectMemberTitleListAll", param);
	}

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
	public int updateTitle(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("mypage.updateTitle", param);
	}

	@Override
	public int updatePasswordForProfile(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("mypage.updatePasswordForProfile", param);
	}

	@Override
	public int updatePassword(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("mypage.updatePassword", param);
	}

	@Override
	public int WithdrawalEmail(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("mypage.WithdrawalEmail", param);
	}

	@Override
	public int restoreEmail(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("mypage.restoreEmail", param);
	}

}
