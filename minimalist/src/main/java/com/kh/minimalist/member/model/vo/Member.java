package com.kh.minimalist.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {
	/*
	 *  아래것을 안넣으면 스프링에서 에러남
	 */
	private static final long serialVersionUID = 1111111112L;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private Date birth;
	private Date regist_date;
	private String phone;
	private String post;
	private String address1;
	private String address2;
	private int point;
	private int grade;
	private char dormant_yn;
	private String email;
	private String salt;
	
	
	public Member() {
		super();
	}
	
	public Member(String member_id, String member_pwd, String member_name, Date birth, Date regist_date, String phone,
			String post, String address1, String address2, int point, int grade, char dormant_yn, String email,
			String salt) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.birth = birth;
		this.regist_date = regist_date;
		this.phone = phone;
		this.post = post;
		this.address1 = address1;
		this.address2 = address2;
		this.point = point;
		this.grade = grade;
		this.dormant_yn = dormant_yn;
		this.email = email;
		this.salt = salt;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Date getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public char getDormant_yn() {
		return dormant_yn;
	}
	public void setDormant_yn(char dormant_yn) {
		this.dormant_yn = dormant_yn;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_name=" + member_name
				+ ", birth=" + birth + ", regist_date=" + regist_date + ", phone=" + phone + ", post=" + post
				+ ", address1=" + address1 + ", address2=" + address2 + ", point=" + point + ", grade=" + grade
				+ ", dormant_yn=" + dormant_yn + ", email=" + email + ", salt=" + salt + "]";
	}
	
	
}
