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
	public ArrayList<Review> selectList(HashMap<String, Object> map) {
		
		return reviewDao.selectList(map);
		
		
	}

	@Override
	public Review selectOne(int review_no) {
		
		return reviewDao.selectOne(review_no);
	}

	@Override
	public int insertReview(Review review) {
		
		return reviewDao.insertReview(review);
	}

	@Override
	public int updateReview(Review review) {
	
		return reviewDao.updateReview(review);
	}

	@Override
	public int deleteReview(int review_no) {
	
		return reviewDao.deleteReview(review_no);
	}

	@Override
	public ArrayList<Review> myReview(String member_id) {
		return reviewDao.myReview(member_id);
	}
}
