package com.kh.minimalist.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.review.model.vo.Review;

@Repository("reviewDao")
public class ReviewDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int countRow(int product_code){
		
		return sqlSession.selectOne("Review.countRow", product_code);
	}
	
	public ArrayList<Review> selectList(HashMap map){
		List list=null;
		
		list=sqlSession.selectList("Review.selectList", map);
		
		return (ArrayList<Review>)list;
		
	}
	
	public Review selectOne(int review_no){
		
		return sqlSession.selectOne("Review.selectOne", review_no);
	}
	
	public int insertReview(Review review){
		
		return sqlSession.insert("Review.insertReview", review);
	}
	
	public int updateReview(Review review){
		
		return sqlSession.update("Review.updateReview", review);
	}
	
	public int deleteReview(int review_no){
		
		return sqlSession.delete("Review.deleteReview", review_no);
	}
}
