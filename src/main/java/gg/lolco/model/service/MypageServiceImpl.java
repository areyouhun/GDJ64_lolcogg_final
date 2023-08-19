package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.MypageDao;
import gg.lolco.model.vo.MemberTitle;
import gg.lolco.model.vo.QaBoard;

@Service
public class MypageServiceImpl implements MypageService {

	private final MypageDao dao;
	private final SqlSession session;
	 
	public MypageServiceImpl(MypageDao dao, SqlSession session) {
		this.dao = dao;
		this.session = session;
	}

	@Override
	public List<MemberTitle> selectMemberTitleListAll(Map param) {
		// TODO Auto-generated method stub
		return dao.selectMemberTitleListAll(session, param);
	}

	@Override
	public int updateAbbrTeam(Map param) {
		// TODO Auto-generated method stub
		return dao.updateAbbrTeam(session, param);
	}

	@Override
	public int updateProfileImg(Map param) {
		// TODO Auto-generated method stub
		return dao.updateProfileImg(session, param);
	}

	
	@Override
	public int updateTitle(Map param) {
		// TODO Auto-generated method stub
		return dao.updateTitle(session, param);
	}

	@Override
	public int updatePasswordForProfile(Map param) {
		// TODO Auto-generated method stub
		return dao.updatePasswordForProfile(session, param);
	}

	@Override
	public int updatePassword(Map param) {
		// TODO Auto-generated method stub
		return dao.updatePassword(session, param);
	}

	@Override
	public int WithdrawalEmail(Map param) {
		// TODO Auto-generated method stub
		return dao.WithdrawalEmail(session, param);
	}
	
	@Override
	public int restoreEmail(Map param) {
		// TODO Auto-generated method stub
		return dao.restoreEmail(session, param);
	}

}
