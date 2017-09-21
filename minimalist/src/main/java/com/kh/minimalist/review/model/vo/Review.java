package com.kh.minimalist.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {

	
	private static final long serialVersionUID = 1130015242649040330L;
	private int review_no;
	private int product_code;
	private String member_id;
	private String review_title;
	private String review_content;
	private int review_rating;
	private String original_img_name;
	private String rename_img_name;
	private Date review_date;
	
	public Review(){}


	public Review(int review_no, int product_code, String member_id, String review_title, String review_content,
			int review_rating, String original_img_name, String rename_img_name, Date review_date) {
		super();
		this.review_no = review_no;
		this.product_code = product_code;
		this.member_id = member_id;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_rating = review_rating;
		this.original_img_name = original_img_name;
		this.rename_img_name = rename_img_name;
		this.review_date=review_date;
	}


	public int getReview_no() {
		return review_no;
	}


	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}


	public int getProduct_code() {
		return product_code;
	}


	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getReview_title() {
		return review_title;
	}


	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}


	public String getReview_content() {
		return review_content;
	}


	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}


	public int getReview_rating() {
		return review_rating;
	}


	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}


	public String getOriginal_img_name() {
		return original_img_name;
	}


	public void setOriginal_img_name(String original_img_name) {
		this.original_img_name = original_img_name;
	}


	public String getRename_img_name() {
		return rename_img_name;
	}


	public void setRename_img_name(String rename_img_name) {
		this.rename_img_name = rename_img_name;
	}


	public Date getReview_date() {
		return review_date;
	}


	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	
	
}
