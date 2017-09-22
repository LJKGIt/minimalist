package com.kh.minimalist.product.model.service;

import java.util.ArrayList;

import com.kh.minimalist.product.model.vo.Product;

public interface ProductService {
	Product productDetail(Product product);

	ArrayList<Product> productList(Product product);
	
}
