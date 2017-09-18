package com.kh.minimalist.auction.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Auction implements Serializable {

	
	private static final long serialVersionUID = -3836973302037579389L;
	private int auction_code;
	private String product_name;
	private String product_category;
	private String product_brand;
	private String product_descript;
	private String member_id;
	private int bid_price;
	private Date start_date;
	private Date end_date;
	private String product_size;
	private String product_color;
	private String image_path;
	private String payment_yn;
	
	public Auction(){}
	
	
	





	public Auction(int auction_code, String product_name, String product_category, String product_brand,
			String product_descript, String member_id, int bid_price, Date start_date, Date end_date,
			String product_size, String product_color, String image_path, String payment_yn) {
		super();
		this.auction_code = auction_code;
		this.product_name = product_name;
		this.product_category = product_category;
		this.product_brand = product_brand;
		this.product_descript = product_descript;
		this.member_id = member_id;
		this.bid_price = bid_price;
		this.start_date = start_date;
		this.end_date = end_date;
		this.product_size = product_size;
		this.product_color = product_color;
		this.image_path = image_path;
		this.payment_yn = payment_yn;
	}








	public int getAuction_code() {
		return auction_code;
	}


	public void setAuction_code(int auction_code) {
		this.auction_code = auction_code;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getProduct_category() {
		return product_category;
	}


	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}


	public String getProduct_brand() {
		return product_brand;
	}


	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}


	public String getProduct_descript() {
		return product_descript;
	}


	public void setProduct_descript(String product_descript) {
		this.product_descript = product_descript;
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


	public String getProduct_size() {
		return product_size;
	}


	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}


	public String getProduct_color() {
		return product_color;
	}


	public void setProduct_color(String product_color) {
		this.product_color = product_color;
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
		return "Auction [auction_code=" + auction_code + ", product_name=" + product_name + ", product_category="
				+ product_category + ", product_brand=" + product_brand + ", product_descript=" + product_descript
				+ ", member_id=" + member_id + ", bid_price=" + bid_price + ", start_date=" + start_date + ", end_date="
				+ end_date + ", product_size=" + product_size + ", product_color=" + product_color + ", image_path="
				+ image_path + "]";
	}

	
	

	
	
	
	
	
	
}
