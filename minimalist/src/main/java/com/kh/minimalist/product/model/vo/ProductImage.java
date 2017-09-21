package com.kh.minimalist.product.model.vo;

import java.io.Serializable;

public class ProductImage implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3936087877142336336L;
	private int product_code;
	private String product_image_path;

	public ProductImage(){
	}
	
	public ProductImage(int product_code, String product_image_path) {
		this.product_code = product_code;
		this.product_image_path = product_image_path;
	}

	@Override
	public String toString() {
		return "ProductImage [product_code=" + product_code + ", product_image_path=" + product_image_path + "]";
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public String getProduct_image_path() {
		return product_image_path;
	}

	public void setProduct_image_path(String product_image_path) {
		this.product_image_path = product_image_path;
	}

}