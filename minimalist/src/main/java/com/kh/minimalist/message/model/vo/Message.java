package com.kh.minimalist.message.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable, Cloneable{
	private static final long serialVersionUID = -383697330037579389L;
	private int message_number;
	private String member_id;
	private String message_title;
	private String message_content;
	private Date send_date;
	private char check_yn;
	public Message() {
		super();
	}
	public Message(int message_number, String member_id, String message_title, String message_content, Date send_date,
			char check_yn) {
		super();
		this.message_number = message_number;
		this.member_id = member_id;
		this.message_title = message_title;
		this.message_content = message_content;
		this.send_date = send_date;
		this.check_yn = check_yn;
	}
	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	public int getMessage_number() {
		return message_number;
	}
	public void setMessage_number(int message_number) {
		this.message_number = message_number;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	public char getCheck_yn() {
		return check_yn;
	}
	public void setCheck_yn(char check_yn) {
		this.check_yn = check_yn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Message [message_number=" + message_number + ", member_id=" + member_id + ", message_title="
				+ message_title + ", message_content=" + message_content + ", send_date=" + send_date + ", check_yn="
				+ check_yn + "]";
	}
	
}
