package com.kh.minimalist.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

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

	// TODO [lintogi] ■ 로그인 시 이전 페이지 유지하는 기능이 합쳐지지 않았다.
	// TODO [lintogi] 완성될 쯤에 DB 스크립트 파일에 컬럼별로 주석을 추가하고, COMMENTS 값을 삽입하기.
	// TODO [lintogi] ■ ACUTION 테이블에 product_name, category 등이 쓰이던데 이름이 겹치니 바꿔도 되는지 여쭤보기.

	@RequestMapping(value = "productDetail.do", method = RequestMethod.GET)
	public String productDetail(Product product, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String returnResult = "main/404";

		// TODO [lintogi] product-mapper.xml에서 update 쿼리문이 실행되지 않는다.
		// ______________ <update> 태그에는 문제가 없다. 쿼리문(내용)만 SELECT로 바꾸면 잘 된다.
		// _______________________________________ └-> SELECT * FROM PRODUCT WHERE PRODUCT_CODE = #{product_code}
		// ______________ 위 결과에 따르면 #{} 기호는 문제가 없다.
		// ______________ 대, 소문자 차이도 확인해봤지만 똑같다.
		// ______________ UPDATE PRODUCT SET PRODUCT_HIT = 15 와 같이 #{} 기호 없이, parameterType 없이 작업해봤지만 문제는 여전하다.
		// ______________ 위 결과에 따르면 순수하게 UPDATE 구문에 문제가 있다.
		// ______________ 그렇다고 UPDATE PRODUCT만 써보면 SET가 없다고 오류가 나오기는 한다.
		// ______________ productList.do 등 다른 페이지는 잘 나오니 maven, spring, server 문제는 아니다.
		// ______________ Repositories를 날려보고 이클립스를 껐다 켜도 문제는 여전하다.

		System.out.println("1");
		// productService.productHit(product);
		System.out.println("2");

		Product product_return = productService.productDetail(product);

		Wish wish = null;
		if ((Member) session.getAttribute("member") != null) {
			wish = wishService.wishSelectOne(new Wish(((Member) session.getAttribute("member")).getMember_id(), product.getProduct_code()));
		}

		// UPDATE COOKIE
		if ((Member) session.getAttribute("member") != null) {
			try {
				new CookieUtils().setCookie(((Member) session.getAttribute("member")).getMember_id(), String.valueOf(product.getProduct_code()), 365, request, response);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		if (product_return != null) {
			model.addAttribute("product", product_return);
			model.addAttribute("wish", wish);
			returnResult = "product/product_detail";
		}

		return returnResult;

	}

	// TODO [lintogi] JSON으로 마무리하기.
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public String productList(Product product, HttpServletRequest request, HttpServletResponse response, Model model) {
		String returnResult = "main/404";

		boolean withAjax = false;
		int productPage = 1;
		int totalCount = productService.productTotalCount(product);
		int startCount = 0;
		int endCount = 0;

		// AJAX로 접근했는지 확인
		if (request.getParameter("productPage") != null) {
			withAjax = true;
			try {
				productPage = Integer.parseInt(request.getParameter("productPage"));
			} catch (NumberFormatException e) {
				return "main/404";
			}
		}

		// productPage에 잘못된 값이 들어왔을 때
		if ((productPage - 1) * 9 + 1 > totalCount) {
			productPage = totalCount / 9;
		} else if (productPage < 0) {
			productPage = 1;
		}

		startCount = (productPage - 1) * 9 + 1;
		if (Math.ceil(totalCount / 9.0) == productPage) {
			endCount = totalCount;
		} else {
			endCount = productPage * 9;
		}

		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("product", product);
		hashMap.put("startCount", startCount);
		hashMap.put("endCount", endCount);
		ArrayList<Product> productList = productService.productList(hashMap);

		if (productList != null && productList.size() != 0) {

			if (withAjax) {

				PrintWriter writer = null;
				try {
					returnResult = null;
					writer = response.getWriter();
					writer.append("true");
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					writer.flush();
					writer.close();
				}

			} else {
				model.addAttribute("productList", productList);
				returnResult = "product/product_list";
			}
		}

		return returnResult;
	}

	// TODO [lintogi] UPDATE 오류다.
	@RequestMapping(value = "productDelete.do", method = RequestMethod.POST)
	public String productDelete(Product product, Model model, HttpSession session) {
		String returnResult = "main/404";
		System.out.println(product);
		if (session.getAttribute("member") != null && ((Member) session.getAttribute("member")).getMember_id().equals("admin")) {
			int result = productService.productDelete(product);
			if (result > 0) {
				returnResult = "redirect:productList.do";
			}
		}

		return returnResult;
	}

	@RequestMapping(value = "productInsert.do", method = RequestMethod.POST)
	public String productInsert(Product product, Model model, HttpSession session) {
		String returnResult = "main/404";

		if (session.getAttribute("member") != null && ((Member) session.getAttribute("member")).getMember_id().equals("admin")) {
			int result = productService.productInsert(product);
			if (result > 0) {
				// TODO [lintogi] 쿼리스트링 말고 이미 model에 requestScope로 담겨진 product니까 그냥 전달되는지 확인하기.
				returnResult = "redirect:productDetail.do?product_code=" + product.getProduct_code();
			}
		}

		return returnResult;
	}

	// TODO [litogi] 수정 페이지 만들기.
	@RequestMapping(value = "productUpdate.do", method = RequestMethod.POST)
	public String productUpdate(Product product, Model model, HttpSession session) {
		String returnResult = "main/404";

		if (session.getAttribute("member") != null && ((Member) session.getAttribute("member")).getMember_id().equals("admin")) {
			// int result = productService.productUpdate(product);
			// if (result > 0) {
			// // TODO [lintogi] 쿼리스트링 말고 이미 model에 requestScope로 담겨진 product니까 그냥 전달되는지 확인하기.
			// returnResult = "redirect:productDetail.do?product_code=" +
			// product.getProduct_code();
			// }
		}

		return returnResult;
	}

}
