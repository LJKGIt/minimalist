package com.kh.minimalist.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.product.model.vo.Product;

@Repository("productDao")
public class ProductDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ProductDao(){
	}
	
	public Product productDetail(Product product) {
		return sqlSession.selectOne("Product.productDetail", product) ;
	}

	public ArrayList<Product> productList(Product product) {
		List<Product> productList = sqlSession.selectList("Product.productList", product);
		return (ArrayList<Product>)productList;
	}
	

}
