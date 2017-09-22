package com.kh.minimalist.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.product.model.dao.ProductDao;
import com.kh.minimalist.product.model.vo.Product;

@Service("productService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDao productDao;
	
	@Override
	public Product productDetail(Product product) {
		return productDao.productDetail(product);
	}

	@Override
	public ArrayList<Product> productList(Product product) {
		return productDao.productList(product);
	}

	@Override
	public void productHit(Product product) {
		System.out.println("3");
		productDao.productHit(product);
		System.out.println("4");
	}


}
