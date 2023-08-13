package gg.lolco.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.MatchPredictionDao;
import gg.lolco.model.dao.QuizDao;

@Service
public class QuizServiceImpl implements QuizService {
	
	private final QuizDao dao;
	private final SqlSessionTemplate session;

	public QuizServiceImpl(QuizDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}
	@Override
	public int finishQuiz(Map param) {
		return dao.finishQuiz(session, param);
	}

}
