package gg.lolco.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface QuizDao {
	int finishQuiz(SqlSessionTemplate session, Map param);
	
	int pointHistory(SqlSessionTemplate session, Map param);
}
