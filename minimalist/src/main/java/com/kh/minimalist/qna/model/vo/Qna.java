package com.kh.minimalist.qna.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Qna implements Serializable {


	private static final long serialVersionUID = 7426857891476859587L;
	private int qna_no;
	private String member_id;
	private String qna_title;
	private String qna_content;
	private String qna_category;
	private String qna_comment;
	private Date qna_date;
	private String img_path;
	
	public Qna(){}

	

	public Qna(int qna_no, String member_id, String qna_title, String qna_content, String qna_category,
			String qna_comment, Date qna_date, String img_path) {
		super();
		this.qna_no = qna_no;
		this.member_id = member_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_category = qna_category;
		this.qna_comment = qna_comment;
		this.qna_date = qna_date;
		this.img_path = img_path;
	}



	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}



	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_category() {
		return qna_category;
	}

	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}

	public String getQna_comment() {
		return qna_comment;
	}

	public void setQna_comment(String qna_comment) {
		this.qna_comment = qna_comment;
	}


	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}



	public String getImg_path() {
		return img_path;
	}



	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	
	
	
	
	
}
