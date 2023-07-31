package gg.lolco.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import gg.lolco.model.vo.PointItem;

public interface StoreDao {
	List<PointItem> selectItem(SqlSession session);
}
