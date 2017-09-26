package com.kh.minimalist.wish.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

import com.kh.minimalist.product.model.vo.Product;
import com.kh.minimalist.product.model.vo.ProductImage;

public class Wish implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7012053293797924814L;
	private String member_id;
	private int product_code;
	
	private Product productJoin;
	
	private ArrayList<ProductImage> productImageJoin;	

	public Product getProduct() {
		return productJoin;
	}

	public void setProduct(Product product) {
		this.productJoin = product;
	}

	public ArrayList<ProductImage> getProductImageJoin() {
		return productImageJoin;
	}

	public void setProductImageJoin(ArrayList<ProductImage> productImageJoin) {
		this.productImageJoin = productImageJoin;
	}

	public Wish() {

	}

	public Wish(String member_id, int product_code) {
		super();
		this.member_id = member_id;
		this.product_code = product_code;
	}

	@Override
	public String toString() {
		return "Wish [member_id=" + member_id + ", product_code=" + product_code + "]";
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

}
