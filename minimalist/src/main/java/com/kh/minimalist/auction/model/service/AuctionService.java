package com.kh.minimalist.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.kh.minimalist.auction.model.vo.Auction;

public interface AuctionService {

	int countRow();
	
	ArrayList<Auction> selectList(HashMap map);
	
	Auction selectOne(int auctionNo);
	
	int bid(Auction auction);
	
	int reloadPrice(int auction_code);
	
	int countRowCategory(String category);
	
	ArrayList<Auction> selectListCategory(HashMap map);
	
	int insertAuction(Auction auction);
	
	int deleteAuction(int auction_code);
	
	int updateAuction(Auction auction);
	
	int countRowEnd();
	
	ArrayList<Auction> selectListEnd(HashMap map);
	
	int checkPayment(HashMap map);
}
