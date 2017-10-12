package com.kh.minimalist.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.product.model.dao.ProductDao;
import com.kh.minimalist.product.model.vo.Product;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;

	@Override
	public Product productDetail(Product product) {
		return productDao.productDetail(product);
	}
	
	@Override
	public int productTotalCount(Product product) {
		return productDao.productTotalCount(product);
	}

	@Override
	public ArrayList<Product> productList(HashMap<String, Object> hashMap) {
		return productDao.productList(hashMap);
	}


	@Override
	public void productHit(Product product) {
		productDao.productHit(product);
	}

	@Override
	public int productDelete(Product product) {
		return productDao.productDelete(product);
	}

	@Override
	public int productInsert(Product product) {
		return productDao.productInsert(product);
	}

	@Override
	public int productUpdate(Product product) {
		return productDao.productUpdate(product);
	}

	@Override
	public int productRecentProductCode() {
		return productDao.productRecentProductCode();
	}

	@Override
	public ArrayList<Product> productList() {
		return productDao.productList();
	}

	@Override
	public ArrayList<Product> productListAll() {
		return productDao.productListAll();
	}

	@Override
	public int productImageInsert(HashMap<String, Object> imageInsertData) {
		return productDao.productImageInsert(imageInsertData);
	}

	@Override
	public int productImageDelete(Product product) {
		return productDao.productImageDelete(product);
	}

	@Override
	public ArrayList<String> selectBrand() {
		return productDao.selectBrand();
	}




}
