package com.kh.minimalist.auction.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Auction implements Serializable {

	
	private static final long serialVersionUID = -3836973302037579389L;
	private int auction_code;
	private String auction_name;
	private String auction_category;
	private String auction_brand;
	private String auction_descript;
	private int start_price;
	private Date start_date;
	private Date end_date;
	private String auction_size;
	private String auction_color;
	private String image_path;
	private String payment_yn;
	
	//입찰 정보 테이블
	private ArrayList<BidInfo> bidInfo;
	
	public Auction(){}

	public Auction(int auction_code, String auction_name, String auction_category, String auction_brand,
			String auction_descript, int start_price, Date start_date, Date end_date, String auction_size, String auction_color,
			String image_path, String payment_yn, ArrayList<BidInfo> bidInfo) {
		super();
		this.auction_code = auction_code;
		this.auction_name = auction_name;
		this.auction_category = auction_category;
		this.auction_brand = auction_brand;
		this.auction_descript = auction_descript;
		this.start_price=start_price;
		this.start_date = start_date;
		this.end_date = end_date;
		this.auction_size = auction_size;
		this.auction_color = auction_color;
		this.image_path = image_path;
		this.payment_yn = payment_yn;
		this.bidInfo = bidInfo;
	}

	public int getAuction_code() {
		return auction_code;
	}

	public void setAuction_code(int auction_code) {
		this.auction_code = auction_code;
	}

	public String getAuction_name() {
		return auction_name;
	}

	public void setAuction_name(String auction_name) {
		this.auction_name = auction_name;
	}

	public String getAuction_category() {
		return auction_category;
	}

	public void setAuction_category(String auction_category) {
		this.auction_category = auction_category;
	}

	public String getAuction_brand() {
		return auction_brand;
	}

	public void setAuction_brand(String auction_brand) {
		this.auction_brand = auction_brand;
	}

	public String getAuction_descript() {
		return auction_descript;
	}

	public void setAuction_descript(String auction_descript) {
		this.auction_descript = auction_descript;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getAuction_size() {
		return auction_size;
	}

	public void setAuction_size(String auction_size) {
		this.auction_size = auction_size;
	}

	public String getAuction_color() {
		return auction_color;
	}

	public void setAuction_color(String auction_color) {
		this.auction_color = auction_color;
	}

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	public String getPayment_yn() {
		return payment_yn;
	}

	public void setPayment_yn(String payment_yn) {
		this.payment_yn = payment_yn;
	}

	public ArrayList<BidInfo> getBidInfo() {
		return bidInfo;
	}

	public void setBidInfo(ArrayList<BidInfo> bidInfo) {
		this.bidInfo = bidInfo;
	}

	public int getStart_price() {
		return start_price;
	}

	public void setStart_price(int start_price) {
		this.start_price = start_price;
	}


	
	
	
	
}
