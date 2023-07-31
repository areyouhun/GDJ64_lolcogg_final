package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.Member;

public interface MemberService {

	List<Map<String, Object>> selectAll();

	Member selectMemberById(Map param);
}
