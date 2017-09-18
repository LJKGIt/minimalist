package com.kh.minimalist.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Product implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2222222222222222222L;
	private int product_code;
	private String product_name;
	private String product_category;
	private String product_brand;
	private String product_descript;
	private int rent_price;
	private int product_quantity;
	private int rent_count;
	private String product_size;
	private String product_color;
	private Date receive_date;

	public Product() {
	}

	public Product(int product_code, String product_name, String product_category, String product_brand,
			String product_descript, int rent_price, int product_quantity, int rent_count, String product_size,
			String product_color, Date receive_date) {
		super();
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_category = product_category;
		this.product_brand = product_brand;
		this.product_descript = product_descript;
		this.rent_price = rent_price;
		this.product_quantity = product_quantity;
		this.rent_count = rent_count;
		this.product_size = product_size;
		this.product_color = product_color;
		this.receive_date = receive_date;
	}

	@Override
	public String toString() {
		return "Product [product_code=" + product_code + ", product_name=" + product_name + ", product_category="
				+ product_category + ", product_brand=" + product_brand + ", product_descript=" + product_descript
				+ ", rent_price=" + rent_price + ", product_quantity=" + product_quantity + ", rent_count=" + rent_count
				+ ", product_size=" + product_size + ", product_color=" + product_color + ", receive_date="
				+ receive_date + "]";
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
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

	public int getRent_price() {
		return rent_price;
	}

	public void setRent_price(int rent_price) {
		this.rent_price = rent_price;
	}

	public int getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}

	public int getRent_count() {
		return rent_count;
	}

	public void setRent_count(int rent_count) {
		this.rent_count = rent_count;
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

	public Date getReceive_date() {
		return receive_date;
	}

	public void setReceive_date(Date receive_date) {
		this.receive_date = receive_date;
	}

}
