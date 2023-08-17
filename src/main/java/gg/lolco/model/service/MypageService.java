package gg.lolco.model.service;

import java.util.Map;

public interface MypageService {

	int updateAbbrTeam(Map param);
	int updateProfileImg(Map param);
	int updatePasswordForProfile(Map param);
	int updatePassword(Map param);
	int WithdrawalEmail(Map param);
}
