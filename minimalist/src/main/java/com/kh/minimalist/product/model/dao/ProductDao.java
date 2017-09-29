package com.kh.minimalist.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

	public int productTotalCount(Product product) {
		return sqlSession.selectOne("Product.productTotalCount", product);
	}

	public ArrayList<Product> productList(HashMap<String, Object> hashMap) {
		List<Product> productList = sqlSession.selectList("Product.productList", hashMap);
		return (ArrayList<Product>) productList;
	}

	public void productHit(Product product) {
		System.out.println(product);
	}

	public int productDelete(Product product) {
		return sqlSession.update("Product.productDelete", product);
	}

	public int productInsert(Product product) {
		return sqlSession.insert("Product.productInsert", product);
	}

	public int productUpdate(Product product) {
		return sqlSession.update("Product.productUpdate", product);
	}

	public int productRecentProductCode(Product product) {
		return sqlSession.selectOne("Product.productRecentProductCode", product);
	}

	public ArrayList<Product> productList() {
		List<Product> productList = sqlSession.selectList("Product.newProductList");
		return (ArrayList<Product>) productList;
	}

	public ArrayList<Product> productListAll() {
		List<Product> list = sqlSession.selectList("Product.productListAll");
		return (ArrayList<Product>) list;
	}

}
