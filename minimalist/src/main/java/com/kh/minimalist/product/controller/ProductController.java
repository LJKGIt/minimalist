package com.kh.minimalist.product.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.minimalist.cookie.CookieUtils;
import com.kh.minimalist.member.model.vo.Member;
import com.kh.minimalist.product.model.service.ProductService;
import com.kh.minimalist.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	
	// TODO [lintogi] 찜 목록을 만들기.
	// TODO [lintogi] list.jsp의 바탕을 하얗게 만들기.
	

	
	@RequestMapping(value = "productDetail.do", method = RequestMethod.GET)
	public String productDetail(Product product, Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		String result = null;

		Product product_return = productService.productDetail(product);

		// UPDATE COOKIE
		if((Member) session.getAttribute("member") != null){
			try {
				new CookieUtils().setCookie(((Member) session.getAttribute("member")).getMember_id(),
						String.valueOf(product.getProduct_code()), 365, request, response);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if (product_return != null) {
			model.addAttribute("product", product_return);
			result = "product/product_detail";
		} else {
			result = "main/404";
		}

		return result;
	
	}

	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public String productList(Product product, Model model) {
		String result = null;
		ArrayList<Product> productList = productService.productList(product);
		if (productList != null && productList.size() != 0) {
			model.addAttribute("productList", productList);
			result = "product/product_list";
		} else {
			result = "main/404";
		}

		return result;
	}

}
