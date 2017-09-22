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

	public ProductDao() {
	}

	public Product productDetail(Product product) {
		return sqlSession.selectOne("Product.productDetail", product);
	}

	public ArrayList<Product> productList(Product product) {
		List<Product> productList = sqlSession.selectList("Product.productList", product);
		return (ArrayList<Product>) productList;
	}

	public void productHit(Product product) {
		System.out.println("5");
		System.out.println(product);
		sqlSession.update("Product.productHit", product);
		System.out.println("6");
	}

	public int productDelete(Product product) {
		return sqlSession.update("Product.productDelete", product);
	}

}
