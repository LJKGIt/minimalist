package com.kh.minimalist.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.minimalist.review.model.vo.Review;

public interface ReviewService {

	
	int countRow(int product_code);
	
	ArrayList<Review> selectList(HashMap<String, Object> map);
	
	Review selectOne(int review_no);
	
	int insertReview(Review review);
	
	int updateReview(Review review);
	
	int deleteReview(int review_no);

	ArrayList<Review> myReview(String member_id);
}
