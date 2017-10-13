package com.kh.minimalist.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;


import com.kh.minimalist.auction.model.vo.Auction;
import com.kh.minimalist.auction.model.vo.BidInfo;

public interface AuctionService {

	int countRow();
	
	ArrayList<Auction> selectList(HashMap<String, Object> map);
	
	Auction selectOne(int auctionNo);
	
	int bid(BidInfo bid);
	
	int reloadPrice(int auction_code);
	
	int countRowCategory(String auction_category);
	
	ArrayList<Auction> selectListAuctionCategory(HashMap<String, Object> map);
	
	int insertAuction(Auction auction);
	
	int deleteAuction(int auction_code);
	
	int updateAuction(Auction auction);
	
	int countRowEnd();
	
	ArrayList<Auction> selectListEnd(HashMap<String, Object> map);
	
	int checkPayment(HashMap<String, Object> map);

	ArrayList<Auction> selectMemberAuction(String member_id);
	
	int deleteBid(BidInfo bid);
	
	Auction selectOneEnd(int auction_code);
	
	int auctionStop(int auction_code);
}
