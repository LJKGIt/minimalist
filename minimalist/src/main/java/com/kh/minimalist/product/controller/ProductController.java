package com.kh.minimalist.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.minimalist.commonUtil.CookieUtils;
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
	// TODO [lintogi] ■ 탭에 이미지 아이콘 넣기. (9월 25일에 란희에게 맡겼다.)
	// TODO [lintogi] 완성될 쯤에 DB 스크립트 파일에 컬럼별로 주석을 추가하고, COMMENTS 값을 삽입하기.
	// TODO [lintogi] 완성될 쯤에 반응형 웹에 대해 링크 연결을 싹 정리하기.
	// TODO [lintogi] ■ 관리자 페이지에서 좌측에 까맣게 표시해주는 걸 aside_admin.jsp 내에서 자바스크립트로
	// 처리하기.
	// TODO [lintogi] 데이터 넣고나서 재영이 형에게 메인 홈페이지 TOP 상품에 대해서 순서 다시 확인 받기.

	@RequestMapping(value = "productDetail.do", method = RequestMethod.GET)
	public String productDetail(Product product, Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		String returnResult = "main/404";
		String member_id = null;
		if (session.getAttribute("member") != null) {
			member_id = ((Member) session.getAttribute("member")).getMember_id();
		}
		productService.productHit(product);

		Product product_return = productService.productDetail(product);

		Wish wish = null;
		if (member_id != null) {
			wish = wishService.wishSelectOne(new Wish(member_id, product.getProduct_code()));
		}

		// UPDATE COOKIE
		if (member_id != null) {
			try {
				new CookieUtils().setCookie(member_id, String.valueOf(product.getProduct_code()), 365, request,
						response);
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

	// TODO [lintogi] 또 imgae 순서가 이상하다.
	// TODO [lintogi] JSON으로 마무리하기.
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public String productList(Product product, HttpServletRequest request, HttpServletResponse response, Model model) {
		String returnResult = "main/404";

		boolean withAjax = false;
		int productPage = 1;
		int totalCount = productService.productTotalCount(product);
		int startCount = 0;
		int endCount = 0;
		// product_category가 null이면 기본 값을 주기.
		if (product.getProduct_category() == null) {
			product.setProduct_category("outer");
		}
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

	@RequestMapping(value = "productInsertView.do", method = RequestMethod.GET)
	public String productInsertView(Model model, HttpSession session) {
		String returnResult = "main/404";
		if (session.getAttribute("member") != null
				&& ((Member) session.getAttribute("member")).getMember_id().equals("admin")) {
			returnResult = "product/productInsertView";
		}
		return returnResult;
	}

	// TODO [lintogi] 이미지 삽입하는 것을 처리하기.
	// TODO [lintogi] 이미지를 업로드하면 우선 서버로 올려주고, input[type=hidden]으로 값을 넣어줘서 넘겨주면
	// 될 것 같다.
	// TODO [lintogi] 그리고 PRODUCT 테이블에 삽입하고 PRODUCT_IMAGE 테이블에 삽입해주는 과정을 거친다.
	@RequestMapping(value = "productInsert.do", method = RequestMethod.POST)
	public String productInsert(Product product, Model model, HttpSession session) {
		String returnResult = "main/404";
		product.setProduct_code(1500000026);
		if (session.getAttribute("member") != null
				&& ((Member) session.getAttribute("member")).getMember_id().equals("admin")) {
			int result = productService.productInsert(product);
			if (result > 0) {
				returnResult = "redirect:productDetail.do?product_code="
						+ productService.productRecentProductCode(product);
			}
		}

		return returnResult;
	}

	// TODO [lintogi] 수정 페이지 만들기.
	@RequestMapping(value = "productUpdate.do", method = RequestMethod.POST)
	public String productUpdate(Product product, Model model, HttpSession session) {
		String returnResult = "main/404";

		// if (session.getAttribute("member") != null
		// && ((Member)
		// session.getAttribute("member")).getMember_id().equals("admin")) {
		// int result = productService.productUpdate(product);
		// if (result > 0) {
		// returnResult = "redirect:productDetail.do?product_code="
		// + productService.productRecentProductCode(product);
		// product.getProduct_code();
		// }
		// }

		return returnResult;
	}

	// TODO [lintogi] 파비콘이 나오지 않는 것에 대해서 알아보기.
	// TODO [lintogi] UPDATE 오류다.
	@RequestMapping(value = "productDelete.do", method = RequestMethod.GET)
	public String productDelete(Product product, Model model, HttpSession session) {
		String returnResult = "main/404";
		if (session.getAttribute("member") != null
				&& ((Member) session.getAttribute("member")).getMember_id().equals("admin")) {
			int result = productService.productDelete(product);
			if (result > 0) {
				returnResult = "redirect:productList.do";
			}
		}
		return returnResult;
	}

	@RequestMapping(value = "productImageUpload.do", method = RequestMethod.POST)
	public void productImageUpload(Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, MultipartHttpServletRequest multi) {
		String returnResult = "false";
		// TODO [lintogi] 경로가 target 아래로 잡힌다. 해결하기.
		// String root =
		// request.getSession().getServletContext().getRealPath("/");
		String root = "C:\\workspace\\minimalist\\src\\main\\webapp\\";
		String path = root + "resources\\img_product\\";
		String newFileName = "";
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		Iterator<String> files = multi.getFileNames();
		while (files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			// TODO [lintogi] 테이블에 컬럼 추가하기.
			// 그리고 "true" + "바뀐 이름" 값을 view의 jquery까지 보내주기. index hidden까지 옮기기.
			// newFileName = System.currentTimeMillis() + "." +
			// fileName.substring(fileName.lastIndexOf(".") + 1);
			newFileName = fileName;
			try {
				mFile.transferTo(new File(path + newFileName));
				returnResult = "true";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
			response.getWriter().append(returnResult);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
