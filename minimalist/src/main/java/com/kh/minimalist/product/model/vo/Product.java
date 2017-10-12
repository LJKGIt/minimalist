package com.kh.minimalist.product.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Product implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5987396132497857945L;
	private int product_code;
	private String product_name;
	private String product_category;
	private String product_brand;
	private String product_descript;
	private int product_original_price;
	private int rent_price;
	private String product_size33 = "0";
	private String product_size44 = "0";
	private String product_size55 = "0";
	private String product_size66 = "0";
	private String product_size77 = "0";
	private String product_color;
	private Date receive_date;
	private int product_hit;
	private String product_delete;

	private ArrayList<ProductImage> productImageList;

	public Product() {
	}

	public Product(int product_code) {
		super();
		this.product_code = product_code;
	}

	public Product(int product_code, String product_name, String product_category, String product_brand,
			String product_descript, int product_original_price, int rent_price, String product_size33,
			String product_size44, String product_size55, String product_size66, String product_size77,
			String product_color, Date receive_date, int product_hit, String product_delete,
			ArrayList<ProductImage> productImageList) {
		super();
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_category = product_category;
		this.product_brand = product_brand;
		this.product_descript = product_descript;
		this.product_original_price = product_original_price;
		this.rent_price = rent_price;
		this.product_size33 = product_size33;
		this.product_size44 = product_size44;
		this.product_size55 = product_size55;
		this.product_size66 = product_size66;
		this.product_size77 = product_size77;
		this.product_color = product_color;
		this.receive_date = receive_date;
		this.product_hit = product_hit;
		this.product_delete = product_delete;
		this.productImageList = productImageList;
	}

	@Override
	public String toString() {
		return "Product [product_code=" + product_code + ", product_name=" + product_name + ", product_category="
				+ product_category + ", product_brand=" + product_brand + ", product_descript=" + product_descript
				+ ", product_original_price=" + product_original_price + ", rent_price=" + rent_price
				+ ", product_size33=" + product_size33 + ", product_size44=" + product_size44 + ", product_size55="
				+ product_size55 + ", product_size66=" + product_size66 + ", product_size77=" + product_size77
				+ ", product_color=" + product_color + ", receive_date=" + receive_date + ", product_hit=" + product_hit
				+ ", product_delete=" + product_delete + ", productImageList=" + productImageList + "]";
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

	public int getProduct_original_price() {
		return product_original_price;
	}

	public void setProduct_original_price(int product_original_price) {
		this.product_original_price = product_original_price;
	}

	public int getRent_price() {
		return rent_price;
	}

	public void setRent_price(int rent_price) {
		this.rent_price = rent_price;
	}

	public String getProduct_size33() {
		return product_size33;
	}

	public void setProduct_size33(String product_size33) {
		this.product_size33 = product_size33;
	}

	public String getProduct_size44() {
		return product_size44;
	}

	public void setProduct_size44(String product_size44) {
		this.product_size44 = product_size44;
	}

	public String getProduct_size55() {
		return product_size55;
	}

	public void setProduct_size55(String product_size55) {
		this.product_size55 = product_size55;
	}

	public String getProduct_size66() {
		return product_size66;
	}

	public void setProduct_size66(String product_size66) {
		this.product_size66 = product_size66;
	}

	public String getProduct_size77() {
		return product_size77;
	}

	public void setProduct_size77(String product_size77) {
		this.product_size77 = product_size77;
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

	public int getProduct_hit() {
		return product_hit;
	}

	public void setProduct_hit(int product_hit) {
		this.product_hit = product_hit;
	}

	public String getProduct_delete() {
		return product_delete;
	}

	public void setProduct_delete(String product_delete) {
		this.product_delete = product_delete;
	}

	public ArrayList<ProductImage> getProductImageList() {
		return productImageList;
	}

	public void setProductImageList(ArrayList<ProductImage> productImageList) {
		this.productImageList = productImageList;
	}

}
