package com.kh.minimalist.message.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.minimalist.member.model.vo.Member;
import com.kh.minimalist.message.model.service.MessageService;
import com.kh.minimalist.product.model.service.ProductService;

public class MessageInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private ProductService productService;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Member currMem = (Member) request.getSession().getAttribute("member");
		
		if (currMem != null)
			request.setAttribute("newMessageCount", messageService.selectMessageCount(currMem.getMember_id()));
		
		request.setAttribute("productListAll", productService.productListAll().toString());
		return super.preHandle(request, response, handler);
	}

}
