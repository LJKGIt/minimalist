package com.kh.minimalist.orderinfo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.orderinfo.model.vo.OrderInfo;

@Repository("orderInfoDao")
public class OrderInfoDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public OrderInfoDao() {
	}

	public int orderInfoInsert(OrderInfo orderInfo) {
		return sqlSession.insert("OrderInfo.orderInfoInsert", orderInfo);
	}

	public ArrayList<OrderInfo> myOrder(HashMap<String, Object> map) {
		List<OrderInfo> list = sqlSession.selectList("OrderInfo.myOrder", map);
		return (ArrayList<OrderInfo>)list;
	}

	public int myOrderCount(HashMap<String, Object> totalCountMap) {
		return sqlSession.selectOne("OrderInfo.myOrderCount", totalCountMap);
	}


}
