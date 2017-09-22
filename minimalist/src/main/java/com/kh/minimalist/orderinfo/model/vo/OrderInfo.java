package com.kh.minimalist.orderinfo.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class OrderInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5670141999020262654L;
	private int orderinfo_code;
	private String member_id;
	private int product_code;
	private Date orderinfo_date;

	public OrderInfo() {
	}

	public OrderInfo(int orderinfo_code, String member_id, int product_code, Date orderinfo_date) {
		this.orderinfo_code = orderinfo_code;
		this.member_id = member_id;
		this.product_code = product_code;
		this.orderinfo_date = orderinfo_date;
	}

	@Override
	public String toString() {
		return "OrderInfo [orderinfo_code=" + orderinfo_code + ", member_id=" + member_id + ", product_code="
				+ product_code + ", orderinfo_date=" + orderinfo_date + "]";
	}

	public int getOrderinfo_code() {
		return orderinfo_code;
	}

	public void setOrderinfo_code(int orderinfo_code) {
		this.orderinfo_code = orderinfo_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public Date getOrderinfo_date() {
		return orderinfo_date;
	}

	public void setOrderinfo_date(Date orderinfo_date) {
		this.orderinfo_date = orderinfo_date;
	}

}
