package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.QnaDao;
import gg.lolco.model.vo.MemberEmoticon;
import gg.lolco.model.vo.QaBoard;
import gg.lolco.model.vo.QaBoardComment;
import gg.lolco.model.vo.QaBoardFile;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService {

	private QnaDao dao;
	private SqlSessionTemplate session;

	public QnaServiceImpl(QnaDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}

	@Override
	public List<QaBoard> selectQnaListById(Map param) {
		return dao.selectQnaListById(session, param);
	}

	@Override
	public int selectQnaListCountById(String email) {
		return dao.selectQnaListCountById(session, email);
	}

	@Override
	public List<QaBoard> selectQnaListAll(Map param) {
		return dao.selectQnaListAll(session, param);
	}

	@Override
	public int selectQnaListCount() {
		return dao.selectQnaListCount(session);
	}

	@Override
	public QaBoard qnaView(int qaNo) {
		return dao.qnaView(session, qaNo);
	}

	@Override
	public int insertBoard(Map param) {
		int result = dao.insertBoard(session, param);
		if (result > 0) {
			for (Object a : param.keySet()) {
				// a에는 key값이 들어감
				if (String.valueOf(param.get(a)).contains("QaBoardFile")) {
					// if문 true일 경우 무조건 첨부파일 있음
					List<QaBoardFile> files = (List<QaBoardFile>) param.get(a);
					if (files != null) {
					    for (QaBoardFile f : files) {
					        f.setQaNo((int)param.get("qaNo"));
					        result += dao.insertFile(session, f);
					    }
					}
				}
			}
		}

		return result;
	}

	@Override
	public int updateBoard(Map<String,Object> param, List<QaBoardFile> files) {
		int result = dao.updateBoard(session, param);
		if(result > 0) {
			if (files.size()>0) {
				result += dao.deleteFile(session, param);
				
				if (!files.isEmpty()) {
				    for (QaBoardFile f : files) {
				    	f.setQaNo(Integer.parseInt((String)param.get("qaNo")));
				        result += dao.insertFile(session, f);
				    }
		    	}
				files.get(0).setQaNo(Integer.parseInt((String)param.get("qaNo")));
			}
		}
		return result;
	}

	@Override
	public int deleteQna(int qaNo) {
		return dao.deleteQna(session, qaNo);
	}

	@Override
	public int insertComment(Map param) {
		return dao.insertComment(session, param);
	}

	@Override
	public List<QaBoardComment> selectCommentAll(int qaNo) {
		return dao.selectCommentAll(session, qaNo);
	}

	@Override
	public List<MemberEmoticon> myEmo(String email) {
		return dao.myEmo(session, email);
	}

	@Override
	public int deleteComment(String qaNo) {
		return dao.deleteComment(session, qaNo);
	}

}
