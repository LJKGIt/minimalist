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
import com.kh.minimalist.wish.model.service.WishService;
import com.kh.minimalist.wish.model.vo.Wish;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private WishService wishService;

	// TODO [lintogi] 찜 목록을 만들기.

	@RequestMapping(value = "productDetail.do", method = RequestMethod.GET)
	public String productDetail(Product product, Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		String result = null;

		Product product_return = productService.productDetail(product);
		
		// TODO [lintogi] detail.jsp에서 null 여부 확인해서 Wish에 Add, Remove를 처리하기.
		Wish wish = null;
		if((Member) session.getAttribute("member") != null){
			wish = wishService.wishSelectOne(new Wish(((Member) session.getAttribute("member")).getMember_id(), product.getProduct_code()));
		}
		
		// UPDATE COOKIE
		if ((Member) session.getAttribute("member") != null) {
			try {
				new CookieUtils().setCookie(((Member) session.getAttribute("member")).getMember_id(),
						String.valueOf(product.getProduct_code()), 365, request, response);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if (product_return != null) {
			model.addAttribute("product", product_return);
			model.addAttribute("wish", wish);
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
		
		for(Product aa : productList){
			System.out.println(aa);
		}
		
		if (productList != null && productList.size() != 0) {
			model.addAttribute("productList", productList);
			result = "product/product_list";
		} else {
			result = "main/404";
		}

		return result;
	}

}
