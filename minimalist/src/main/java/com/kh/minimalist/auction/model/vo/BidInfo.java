package com.kh.minimalist.auction.model.vo;

import java.io.Serializable;

public class BidInfo implements Serializable {

	
	private static final long serialVersionUID = -432896456331539059L;
	private int auction_code;
	private String member_id;
	private int bid_price;
	
//	입찰가
	private int max_bid;
	
	public int getMax_bid() {
		return max_bid;
	}

	public void setMax_bid(int max_bid) {
		this.max_bid = max_bid;
	}

	public BidInfo(){}

	public BidInfo(int auction_code, String member_id, int bid_price, int max_bid) {
		super();
		this.auction_code = auction_code;
		this.member_id = member_id;
		this.bid_price = bid_price;
		this.max_bid = max_bid;
	}

	public int getAuction_code() {
		return auction_code;
	}

	public void setAuction_code(int auction_code) {
		this.auction_code = auction_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getBid_price() {
		return bid_price;
	}

	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}
	
	
	
}
