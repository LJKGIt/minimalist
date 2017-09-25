package com.kh.minimalist.orderinfo.model.service;

import java.util.ArrayList;

import com.kh.minimalist.orderinfo.model.vo.OrderInfo;

public interface OrderInfoService {

	int orderInfoInsert(OrderInfo orderInfo);
	
	ArrayList<OrderInfo> myOrder(String member_id);
	
}
