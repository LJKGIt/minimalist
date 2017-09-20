package com.kh.minimalist.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.review.model.dao.ReviewDao;
import com.kh.minimalist.review.model.vo.Review;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public int countRow(int product_code) {
		
		return reviewDao.countRow(product_code);
	}

	@Override
	public ArrayList<Review> selectList(HashMap map) {
		
		return reviewDao.selectList(map);
		
		
	}

	@Override
	public Review selectOne(int review_no) {
		
		return reviewDao.selectOne(review_no);
	}
	
}
