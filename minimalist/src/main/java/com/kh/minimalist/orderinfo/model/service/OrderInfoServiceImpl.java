package com.kh.minimalist.orderinfo.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.orderinfo.model.dao.OrderInfoDao;
import com.kh.minimalist.orderinfo.model.vo.OrderInfo;

@Service("orderInfoService")
public class OrderInfoServiceImpl implements OrderInfoService{

	@Autowired
	OrderInfoDao orderInfoDao;

	@Override
	public int orderInfoInsert(OrderInfo orderInfo) {
		return orderInfoDao.orderInfoInsert(orderInfo);
	}

	@Override
	public ArrayList<OrderInfo> myOrder(String member_id) {
		return orderInfoDao.myOrder(member_id);
	}
	
	
	


}
