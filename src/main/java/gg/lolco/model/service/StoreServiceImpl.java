package gg.lolco.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import gg.lolco.model.dao.StoreDao;
import gg.lolco.model.vo.PointItem;

@Service
public class StoreServiceImpl implements StoreService {
	private StoreDao dao;
	private SqlSession session;
	
	public StoreServiceImpl(StoreDao dao,SqlSession session) {
		this.dao=dao;
		this.session=session;
	}
	
	@Override
	public List<PointItem> selectItem() {
		return dao.selectItem(session);
	}

}
