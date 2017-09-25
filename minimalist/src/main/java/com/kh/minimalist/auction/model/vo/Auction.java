package com.kh.minimalist.auction.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Auction implements Serializable {

	
	private static final long serialVersionUID = -3836973302037579389L;
	private int auction_code;
	private String auction_name;
	private String auction_category;
	private String auction_brand;
	private String auction_descript;
	private String member_id;
	private int bid_price;
	private Date start_date;
	private Date end_date;
	private String auction_size;
	private String auction_color;
	private String image_path;
	private String payment_yn;
	
	public Auction(){}
	
	
	





	public Auction(int auction_code, String auction_name, String auction_category, String auction_brand,
			String auction_descript, String member_id, int bid_price, Date start_date, Date end_date,
			String auction_size, String auction_color, String image_path, String payment_yn) {
		super();
		this.auction_code = auction_code;
		this.auction_name = auction_name;
		this.auction_category = auction_category;
		this.auction_brand = auction_brand;
		this.auction_descript = auction_descript;
		this.member_id = member_id;
		this.bid_price = bid_price;
		this.start_date = start_date;
		this.end_date = end_date;
		this.auction_size = auction_size;
		this.auction_color = auction_color;
		this.image_path = image_path;
		this.payment_yn = payment_yn;
	}








	public int getAuction_code() {
		return auction_code;
	}


	public void setAuction_code(int auction_code) {
		this.auction_code = auction_code;
	}


	public String getauction_name() {
		return auction_name;
	}


	public void setAuction_name(String auction_name) {
		this.auction_name = auction_name;
	}


	public String getauction_category() {
		return auction_category;
	}


	public void setAuction_category(String auction_category) {
		this.auction_category = auction_category;
	}


	public String getauction_brand() {
		return auction_brand;
	}


	public void setAuction_brand(String auction_brand) {
		this.auction_brand = auction_brand;
	}


	public String getauction_descript() {
		return auction_descript;
	}


	public void setAuction_descript(String auction_descript) {
		this.auction_descript = auction_descript;
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


	public String getauction_size() {
		return auction_size;
	}


	public void setAuction_size(String auction_size) {
		this.auction_size = auction_size;
	}


	public String getauction_color() {
		return auction_color;
	}


	public void setAuction_color(String auction_color) {
		this.auction_color = auction_color;
	}


	public String getImage_path() {
		return image_path;
	}


	public void setImage_path(String image_path) {
		this.image_path =image_path;
	}


	public String getPayment_yn() {
		return payment_yn;
	}


	public void setPayment_yn(String payment_yn) {
		this.payment_yn = payment_yn;
	}








	@Override
	public String toString() {
		return "Auction [auction_code=" + auction_code + ", auction_name=" + auction_name + ", auction_category="
				+ auction_category + ", auction_brand=" + auction_brand + ", auction_descript=" + auction_descript
				+ ", member_id=" + member_id + ", bid_price=" + bid_price + ", start_date=" + start_date + ", end_date="
				+ end_date + ", auction_size=" + auction_size + ", auction_color=" + auction_color + ", image_path="
				+ image_path + "]";
	}

	
	

	
	
	
	
	
	
}
