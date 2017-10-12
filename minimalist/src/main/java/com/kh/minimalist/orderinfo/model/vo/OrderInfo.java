package com.kh.minimalist.orderinfo.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.minimalist.product.model.vo.Product;

public class OrderInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5670141999020262654L;
	private int orderinfo_code;
	private String member_id;
	private int product_code;
	private Date orderinfo_date;
	private String order_receiver_name;
	private String order_receiver_address;
	private String order_receiver_phone;
	private String order_size;
	private int order_invoice_number;

	private Product productJoin;

	public OrderInfo() {
	}

	

	public OrderInfo(int orderinfo_code, String member_id, int product_code, Date orderinfo_date,
			String order_receiver_name, String order_receiver_address, String order_receiver_phone, String order_size,
			int order_invoice_number, Product productJoin) {
		super();
		this.orderinfo_code = orderinfo_code;
		this.member_id = member_id;
		this.product_code = product_code;
		this.orderinfo_date = orderinfo_date;
		this.order_receiver_name = order_receiver_name;
		this.order_receiver_address = order_receiver_address;
		this.order_receiver_phone = order_receiver_phone;
		this.order_size = order_size;
		this.order_invoice_number = order_invoice_number;
		this.productJoin = productJoin;
	}



	@Override
	public String toString() {
		return "OrderInfo [orderinfo_code=" + orderinfo_code + ", member_id=" + member_id + ", product_code=" + product_code + ", orderinfo_date=" + orderinfo_date + ", order_receiver_name=" + order_receiver_name + ", order_receiver_address=" + order_receiver_address + ", order_receiver_phone=" + order_receiver_phone + ", order_size=" + order_size + ", order_invoice_number=" + order_invoice_number + ", productJoin=" + productJoin + "]";
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

	public String getOrder_receiver_name() {
		return order_receiver_name;
	}

	public void setOrder_receiver_name(String order_receiver_name) {
		this.order_receiver_name = order_receiver_name;
	}

	public String getOrder_receiver_address() {
		return order_receiver_address;
	}

	public void setOrder_receiver_address(String order_receiver_address) {
		this.order_receiver_address = order_receiver_address;
	}

	public String getOrder_receiver_phone() {
		return order_receiver_phone;
	}

	public void setOrder_receiver_phone(String order_receiver_phone) {
		this.order_receiver_phone = order_receiver_phone;
	}

	public String getOrder_size() {
		return order_size;
	}

	public void setOrder_size(String order_size) {
		this.order_size = order_size;
	}

	public int getOrder_invoice_number() {
		return order_invoice_number;
	}

	public void setOrder_invoice_number(int order_invoice_number) {
		this.order_invoice_number = order_invoice_number;
	}

	public Product getProductJoin() {
		return productJoin;
	}

	public void setProductJoin(Product productJoin) {
		this.productJoin = productJoin;
	}

	

}
