package com.kh.minimalist.wish.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.wish.model.vo.Wish;
import com.kh.minimalist.wish.model.dao.WishDao;

@Service("wishService")
public class WishServiceImpl implements WishService {

	@Autowired
	WishDao wishDao;

	@Override
	public int wishInsert(Wish wish) {
		return wishDao.wishInsert(wish);
	}

	@Override
	public int wishDelete(Wish wish) {
		return wishDao.wishDelete(wish);
	}

	@Override
	public Wish wishSelectOne(Wish Wish) {
		return wishDao.wishSelectOne(Wish);
	}

	@Override
	public ArrayList<Wish> myWish(String member_id) {
		return wishDao.myWish(member_id);
	}

}
