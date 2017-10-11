package com.kh.minimalist.orderinfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.minimalist.orderinfo.model.vo.OrderInfo;

public interface OrderInfoService {

	int orderInfoInsert(OrderInfo orderInfo);
	
	ArrayList<OrderInfo> myOrder(HashMap<String, Object> map);
	
	int myOrderCount(HashMap<String, Object> totalCountMap);
}
