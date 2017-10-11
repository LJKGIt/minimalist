package com.kh.minimalist.income.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.minimalist.auction.model.vo.Auction;

public class Income implements Serializable {

	 
	private static final long serialVersionUID = -2237224425899823038L;
	private int income_number;
	private int auction_code;
	private int income;
	private Date income_date;
	private String member_id;
	private String receiver_name;
	private String receiver_address;
	private String receiver_phone;
	private String request;
	private int order_invoice_number;
	private Auction auctionJoin;
	
	public Income(){}


	public Income(int income_number, int auction_code, int income, Date income_date, String member_id,
			String receiver_name, String receiver_address, String receiver_phone, String request,
			int order_invoice_number, Auction auctionJoin) {
		super();
		this.income_number = income_number;
		this.auction_code = auction_code;
		this.income = income;
		this.income_date = income_date;
		this.member_id = member_id;
		this.receiver_name = receiver_name;
		this.receiver_address = receiver_address;
		this.receiver_phone = receiver_phone;
		this.request = request;
		this.order_invoice_number = order_invoice_number;
		this.auctionJoin = auctionJoin;
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

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getReceiver_address() {
		return receiver_address;
	}

	public void setReceiver_address(String receiver_address) {
		this.receiver_address = receiver_address;
	}

	public String getReceiver_phone() {
		return receiver_phone;
	}

	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}

	public int getOrder_invoice_number() {
		return order_invoice_number;
	}

	public void setOrder_invoice_number(int order_invoice_number) {
		this.order_invoice_number = order_invoice_number;
	}



	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public int getIncome_number() {
		return income_number;
	}


	public void setIncome_number(int income_number) {
		this.income_number = income_number;
	}

	
	

	public String getRequest() {
		return request;
	}


	public void setRequest(String request) {
		this.request = request;
	}


	public Auction getAuctionJoin() {
		return auctionJoin;
	}


	public void setAuctionJoin(Auction auctionJoin) {
		this.auctionJoin = auctionJoin;
	}

	

	
}
