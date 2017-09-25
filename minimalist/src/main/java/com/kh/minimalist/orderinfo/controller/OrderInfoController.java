package com.kh.minimalist.orderinfo.controller;

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
	
	// TODO [lintogi] 재영이 형이 만드신 INSERT ALL에 대해서 제약 조건을 이용해 반환 값이 상황에 따라서 어떻게 반환되는지 실험하기.

	// TODO [lintogi] 결제 API를 사용하기.
	@RequestMapping(value = "orderInfoInsert.do", method = RequestMethod.POST)
	public String productDetail(Product product, Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		String returnResult = "main/404";
		int result = 0;

		if ((Member) session.getAttribute("member") != null) {
			OrderInfo orderInfo = new OrderInfo();
			orderInfo.setMember_id(((Member) session.getAttribute("member")).getMember_id());
			orderInfo.setProduct_code(product.getProduct_code());
			result = orderInfoService.orderInfoInsert(orderInfo);
		}
		if (result > 0) {
			// TODO [lintogi] 주문 내역 조회 페이지가 완성되면 거기로 이동시키기.
			returnResult = "main/index";
		}

		return returnResult;

	}

	// TODO [lintogi] JSP 파일을 꾸미기.
	@RequestMapping(value = "orderView.do", method = RequestMethod.GET)
	public String orderVeiw(Product product, Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		String returnResult = "main/404";

		if ((Member) session.getAttribute("member") != null) {
			Product product_return = productService.productDetail(product);
			model.addAttribute("product", product_return);
			returnResult = "order/orderView";
		}

		return returnResult;

	}

}
