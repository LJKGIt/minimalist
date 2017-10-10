package com.kh.minimalist.orderinfo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.minimalist.member.model.vo.Member;
import com.kh.minimalist.orderinfo.model.service.OrderInfoService;
import com.kh.minimalist.orderinfo.model.vo.OrderInfo;
import com.kh.minimalist.product.model.service.ProductService;
import com.kh.minimalist.product.model.vo.Product;

@Controller
public class OrderInfoController {

	@Autowired
	private OrderInfoService orderInfoService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "orderInfoInsert.do", method = RequestMethod.POST)
	public void orderInfoInsert(Product product, OrderInfo orderInfo, Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		int result = 0;
		if ((Member) session.getAttribute("member") != null) {
			orderInfo.setMember_id(((Member) session.getAttribute("member")).getMember_id());
			orderInfo.setProduct_code(product.getProduct_code());
			result = orderInfoService.orderInfoInsert(orderInfo);
		}

		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			if (result > 0)
				writer.append("true");
			else
				writer.append("false");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			writer.flush();
			writer.close();
		}
		
	}

	@RequestMapping(value = "orderView.do", method = RequestMethod.POST)
	public String orderVeiw(Product product, OrderInfo orderInfo, Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		String returnResult = "main/404";
		if ((Member) session.getAttribute("member") != null) {
			Product product_return = productService.productDetail(product);
			model.addAttribute("product", product_return);
			model.addAttribute("orderInfo", orderInfo);
			returnResult = "order/product_order_view";
		}

		return returnResult;

	}

}
