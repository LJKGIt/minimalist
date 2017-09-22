package com.kh.minimalist.orderinfo.model.dao;

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


}
