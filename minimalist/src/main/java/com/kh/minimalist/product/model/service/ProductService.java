package com.kh.minimalist.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.minimalist.product.model.vo.Product;

public interface ProductService {
	Product productDetail(Product product);

	ArrayList<Product> productList(HashMap<String, Object> hashMap);
	
	ArrayList<Product> productList();
	
	ArrayList<Product> productListAll();

	void productHit(Product product);

	int productDelete(Product product);

	int productTotalCount(Product product);

	int productInsert(Product product);
	
	int productUpdate(Product product);

	int productRecentProductCode();
	
	int productImageInsert(HashMap<String, Object> imageInsertData);

	int productImageDelete(Product product);

	ArrayList<String> selectBrand();


}
