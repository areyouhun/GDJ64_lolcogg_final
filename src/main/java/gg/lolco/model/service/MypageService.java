package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import gg.lolco.model.vo.QaBoard;

public interface MypageService {

	int updateAbbrTeam(Map param);
	int updateProfileImg(Map param);
	int updatePasswordForProfile(Map param);
	int updatePassword(Map param);
	int WithdrawalEmail(Map param);

}
