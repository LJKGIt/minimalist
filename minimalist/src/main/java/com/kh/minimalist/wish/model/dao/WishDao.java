package com.kh.minimalist.wish.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.wish.model.vo.Wish;

@Repository("wishDao")
public class WishDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public WishDao() {
	}

	public int wishInsert(Wish wish) {
		return sqlSession.insert("Wish.wishInsert", wish);
	}

	public int wishDelete(Wish wish) {
		return sqlSession.delete("Wish.wishDelete", wish);
	}

	public Wish wishSelectOne(Wish Wish) {
		return sqlSession.selectOne("Wish.wishSelectOne", Wish);
	}

}
