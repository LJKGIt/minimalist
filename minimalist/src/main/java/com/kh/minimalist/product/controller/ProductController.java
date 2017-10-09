package com.kh.minimalist.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

	// TODO [lintogi] ■ 30 검색 기능을 만들기. (사이즈는 슬라이드바를 사용하기.)
	// TODO [lintogi] ■ 50 예약 기능을 추가하기.
	@RequestMapping(value = "productDetail.do", method = RequestMethod.GET)
	public String productDetail(Product product, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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
		try {
			if (member_id != null) {
				new CookieUtils().setCookie(member_id, String.valueOf(product.getProduct_code()), 365, request, response);
			} else {
				new CookieUtils().setCookie("anonymous", String.valueOf(product.getProduct_code()), 365, request, response);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();

		}

		// RECENT VIEW (COOKIE)
		try {
			List<String> list = null;
			ArrayList<Product> cookieList = null;
			if (session.getAttribute("member") != null) {
				list = new CookieUtils().getValueList(((Member) session.getAttribute("member")).getMember_id(), request);
			} else {
				list = new CookieUtils().getValueList("anonymous", request);
			}
			cookieList = new ArrayList<Product>();
			if (list != null) {
				for (String product_code : list)
					cookieList.add(productService.productDetail(new Product(Integer.parseInt(product_code))));
			}
			model.addAttribute("cookieList", cookieList);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		if (product_return != null) {
			model.addAttribute("product", product_return);
			model.addAttribute("wish", wish);
			returnResult = "product/product_detail";
		}

		return returnResult;

	}

	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public String productList(Product product, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
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

		// RECENT VIEW (COOKIE)
		try {
			List<String> list = null;
			ArrayList<Product> cookieList = null;
			if (session.getAttribute("member") != null) {
				list = new CookieUtils().getValueList(((Member) session.getAttribute("member")).getMember_id(), request);
			} else {
				list = new CookieUtils().getValueList("anonymous", request);
			}
			cookieList = new ArrayList<Product>();
			if (list != null) {
				for (String product_code : list)
					cookieList.add(productService.productDetail(new Product(Integer.parseInt(product_code))));
			}
			model.addAttribute("cookieList", cookieList);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return returnResult;
	}

	@RequestMapping(value = "productList2.do", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Product> productList2(Product product, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {

		int productPage = 1;
		int totalCount = productService.productTotalCount(product);
		int startCount = 0;
		int endCount = 0;

		// product_category가 null이면 기본 값을 주기.
		if (product.getProduct_category() == null) {
			product.setProduct_category("outer");
		}

		try {
			productPage = Integer.parseInt(request.getParameter("productPage"));
		} catch (NumberFormatException e) {
			return null;
		}

		// productPage에 잘못된 값이 들어왔을 때
		if ((productPage - 1) * 9 + 1 > totalCount) {
			return null;
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

		return productList;
	}

	@RequestMapping(value = "productInsertView.do", method = RequestMethod.GET)
	public String productInsertView(Model model, HttpSession session) {
		String returnResult = "main/404";
		if (session.getAttribute("member") != null && ((Member) session.getAttribute("member")).getMember_id().equals("admin")) {
			returnResult = "product/product_insert_view";
		}
		return returnResult;
	}

	@RequestMapping(value = "productInsert.do", method = RequestMethod.POST)
	public String productInsert(Product product, Model model, HttpSession session,  HttpServletRequest request) {
		String returnResult = "main/404";

		if (session.getAttribute("member") != null && ((Member) session.getAttribute("member")).getMember_id().equals("admin")) {
			int result1 = productService.productInsert(product);
			if (result1 > 0) {
				int recentProductCode = productService.productRecentProductCode();

				ArrayList<String> imageNameList = new ArrayList<String>();
				imageNameList.add(request.getParameter("n_hidden_image1"));
				imageNameList.add(request.getParameter("n_hidden_image2"));
				imageNameList.add(request.getParameter("n_hidden_image3"));
				
				HashMap<String, Object> imageInsertData = new HashMap<String, Object>();
				imageInsertData.put("recentProductCode", recentProductCode);
				imageInsertData.put("imageNameList", imageNameList);
				
				int result2 = productService.productImageInsert(imageInsertData);
				
				if(result2 > 0){
					returnResult = "redirect:productDetail.do?product_code=" + recentProductCode;
				}
			}
		}

		return returnResult;
	}

	// TODO [lintogi] ■ 20 수정 페이지 만들기.
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

	@RequestMapping(value = "productDelete.do", method = RequestMethod.GET)
	public String productDelete(Product product, Model model, HttpSession session) {
		String returnResult = "main/404";
		if (session.getAttribute("member") != null && ((Member) session.getAttribute("member")).getMember_id().equals("admin")) {
			int result = productService.productDelete(product);
			if (result > 0) {
				returnResult = "redirect:productList.do";
			}
		}
		return returnResult;
	}

	@RequestMapping(value = "productImageUpload.do", method = RequestMethod.POST)
	public void productImageUpload(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multi) {
		String returnResult = "false";
		// String root = multi.getSession().getServletContext().getRealPath("/");
		String root = request.getSession().getServletContext().getRealPath("/").substring(0, request.getSession().getServletContext().getRealPath("/").indexOf("target"));
		String path = root + "src\\main\\webapp\\resources\\img_product\\";
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
			if(fileName != null && !fileName.equals("")){
				// newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				newFileName = fileName;
				try {
					mFile.transferTo(new File(path + newFileName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			returnResult = "true";
		}
		try {
			response.getWriter().append(returnResult);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
