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
		PrintWriter writer = null;
		if ((Member) session.getAttribute("member") != null) {
			Wish wish = new Wish(((Member) session.getAttribute("member")).getMember_id(), product_code);
			int result = wishService.wishInsert(wish);
			try {
				writer = response.getWriter();
				if (result > 0) {
					writer.append("true");
				} else {
					writer.append("false");
				}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				writer.flush();
				writer.close();
			}
		} else {
			try {
				writer = response.getWriter();
				writer.append("login");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				writer.flush();
				writer.close();
			}
		}

	}

	@RequestMapping(value = "wishDelete.do", method = RequestMethod.POST)
	public void wishDelete(@RequestParam("product_code") int product_code, Model model, HttpSession session,
			HttpServletResponse response) {
		PrintWriter writer = null;
		if ((Member) session.getAttribute("member") != null) {
			Wish wish = new Wish(((Member) session.getAttribute("member")).getMember_id(), product_code);
			int result = wishService.wishDelete(wish);
			try {
				writer = response.getWriter();
				if (result > 0) {
					writer.append("true");
				} else {
					writer.append("false");
				}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				writer.flush();
				writer.close();
			}
		} else {
			try {
				writer = response.getWriter();
				writer.append("login");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				writer.flush();
				writer.close();
			}
		}
	}
	
	@RequestMapping("wish.wishlist.do")
	public String myWishList(HttpSession session, Model model) {
		Member member = ((Member) session.getAttribute("member"));
		String result = "main/404";
		if (member != null) {
			model.addAttribute("wishList", wishService.myWish(member.getMember_id()));
			result = "mypage/customer-wishlist";
		}
		return result;
	}


}
