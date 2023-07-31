package gg.lolco.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.Member;

public interface MemberDao {

	List<Map<String, Object>> selectAll(SqlSession session);
	
	Member selectMemberById(SqlSession session, Map param);

}
