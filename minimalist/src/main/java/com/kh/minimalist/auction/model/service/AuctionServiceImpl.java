package com.kh.minimalist.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.auction.model.dao.AuctionDao;
import com.kh.minimalist.auction.model.vo.Auction;

@Service("auctionService")
public class AuctionServiceImpl implements AuctionService {

	@Autowired
	private AuctionDao auctionDao;
	
	@Override
	public int countRow() {

		return auctionDao.countRow();
	}

	@Override
	public ArrayList<Auction> selectList(HashMap<String, Object> map) {
		
		return auctionDao.selectList(map);
	}

	@Override
	public Auction selectOne(int auction_code) {
		
		return auctionDao.selectOne(auction_code);
	}

	@Override
	public int bid(Auction auction) {
		
		return auctionDao.bid(auction);
	}

	@Override
	public int reloadPrice(int auction_code) {
		
		return auctionDao.reloadPrice(auction_code);
	}

	@Override
	public int countRowCategory(String category) {
		
		return auctionDao.countRowCategory(category);
	}

	@Override
	public ArrayList<Auction> selectListCategory(HashMap<String, Object> map) {
		
		return auctionDao.selectListCategory(map);
	}

	@Override
	public int insertAuction(Auction auction) {
		
		return auctionDao.insertAuction(auction);
	}

	@Override
	public int deleteAuction(int auction_code) {
		
		return auctionDao.deleteAuction(auction_code);
	}

	@Override
	public int updateAuction(Auction auction) {
		
		return auctionDao.updateAuction(auction);
	}

	@Override
	public int countRowEnd() {
		
		return auctionDao.countRowEnd();
	}

	@Override
	public ArrayList<Auction> selectListEnd(HashMap<String, Object> map) {
		
		return auctionDao.selectListEnd(map);
	}

	@Override
	public int checkPayment(HashMap<String, Object> map) {
		
		return auctionDao.checkPayment(map);
	}

	@Override
	public ArrayList<Auction> selectMemberAuction(String member_id){
		return auctionDao.selectMemberAuction(member_id);
	}
	
	
}
