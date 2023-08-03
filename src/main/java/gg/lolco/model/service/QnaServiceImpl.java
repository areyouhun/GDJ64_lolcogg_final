package gg.lolco.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.QnaDao;
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
		int result = 0;
		// qna 등록, qna 파일 등록(insert문 2개)
		// 아래 insert문 실행 전 qaNo -> null, 실행 후 qaNo -> 32(selectKey 사용)
//		int result = dao.insertBoard(session, param);

		if (result == 0) {
			for (Object a : param.keySet()) {
				// a에는 key값이 들어감
				if (String.valueOf(param.get(a)).contains("QaBoardFile")) {
					// if문 true일 경우 무조건 첨부파일 있음
//					for(QaBoardComment c : param.get(a)) {
						
//					}
//					[QaBoardFile(qaFileNo=0, qaNo=0, qaOriFilename=KakaoTalk_20230629_013343894.jpg, qaRnmFilename=20230802_191141340_980.jpg)]
				}
			}
		}
//		if(result > 0) {
//			if(param.get("qaFile") != null) { // null?
//				for(int i=0; param.get("qaFile"))
//				for(QaBoardFile f : param.get("qaFile")) {
//				}
//			}
//		}

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

}
