package com.kh.minimalist.wish.model.service;

import com.kh.minimalist.wish.model.vo.Wish;

public interface WishService {
	int wishInsert(Wish wish);

	int wishDelete(Wish wish);

	Wish wishSelectOne(Wish wish);
}
