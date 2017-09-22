package com.kh.minimalist.wish.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.minimalist.member.model.vo.Member;
import com.kh.minimalist.wish.model.service.WishService;
import com.kh.minimalist.wish.model.vo.Wish;

@Controller
public class WishController {

	@Autowired
	private WishService wishService;

	@RequestMapping(value = "wishInsert.do", method = RequestMethod.POST)
	public void wishInsert(@RequestParam("product_code") int product_code, Model model, HttpSession session,
			HttpServletResponse response) {
		
		if ((Member) session.getAttribute("member") != null) {
			Wish wish = new Wish(((Member) session.getAttribute("member")).getMember_id(), product_code);
			// TODO [lintogi] 비회원일 때 처리하기.
			// TODO [lintogi] WISH 테이블에서 두 개 컬럼을 조합으로하여 PRIMARY_KEY를 지정하기.
			int result = wishService.wishInsert(wish);

			
			try {
				PrintWriter writer = response.getWriter();
				if (result > 0) {
					writer.append("true");
				} else {
					writer.append("false");
				}
				// TODO [lintogi] flush, close 하던데 뭔지 알아보기.
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				PrintWriter writer = response.getWriter();
				writer.append("login");
				// TODO [lintogi] flush, close 하던데 뭔지 알아보기.
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value = "wishDelete.do", method = RequestMethod.POST)
	public void wishDelete(@RequestParam("product_code") int product_code, Model model, HttpSession session,
			HttpServletResponse response) {
		Wish wish = new Wish(((Member) session.getAttribute("member")).getMember_id(), product_code);
		// TODO [lintogi] 비회원일 때 처리하기.
		// TODO [lintogi] WISH 테이블에서 두 개 컬럼을 조합으로하여 PRIMARY_KEY를 지정하기.
		int result = wishService.wishDelete(wish);

		try {
			PrintWriter writer = response.getWriter();
			if (result > 0) {
				writer.append("true");
			} else {
				writer.append("false");
			}
			// TODO [lintogi] flush, close 하던데 뭔지 알아보기.
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
