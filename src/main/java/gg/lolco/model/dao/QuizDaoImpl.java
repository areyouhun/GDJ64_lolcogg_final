package gg.lolco.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QuizDaoImpl implements QuizDao {

	@Override
	public int finishQuiz(SqlSessionTemplate session, Map param) {
		return session.update("quiz.finishQuiz", param);
	}

	@Override
	public int pointHistory(SqlSessionTemplate session, Map param) {
		return session.insert("quiz.pointHistory", param);
	}
	
}
