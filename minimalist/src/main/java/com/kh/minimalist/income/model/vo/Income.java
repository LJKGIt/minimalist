package com.kh.minimalist.income.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Income implements Serializable {

	 
	private static final long serialVersionUID = -2237224425899823038L;
	private int product_code;
	private int auction_code;
	private int income;
	private Date income_date;
	
	public Income(){}

	public Income(int product_code, int auction_code, int income, Date income_date) {
		super();
		this.product_code = product_code;
		this.auction_code = auction_code;
		this.income = income;
		this.income_date = income_date;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public int getAuction_code() {
		return auction_code;
	}

	public void setAuction_code(int auction_code) {
		this.auction_code = auction_code;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public Date getIncome_date() {
		return income_date;
	}

	public void setIncome_date(Date income_date) {
		this.income_date = income_date;
	}
	
	
	
	
	
	
}
