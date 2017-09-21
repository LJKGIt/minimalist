package com.kh.minimalist.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.minimalist.product.model.service.ProductService;
import com.kh.minimalist.product.model.vo.Product;
import com.kh.minimalist.qna.model.vo.Qna;
import com.kh.minimalist.review.model.service.ReviewService;
import com.kh.minimalist.review.model.vo.Review;

@Controller("Review")
public class ReviewController {

	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ProductService productService;
	
	//리뷰 리스트
	@RequestMapping(value="review.selectList.do", method={RequestMethod.POST, RequestMethod.GET})
	public String selectList(HttpServletRequest request, Model model){

		//해당 상품에 대한 댓글 불러오기
		int product_code=Integer.parseInt(request.getParameter("product_code"));
		int currentPage=1;
		//현재 페이지
		
		if(request.getParameter("page")!=null){
			//현재 페이지 보정
		
				currentPage=Integer.parseInt(request.getParameter("page"));
	
		}
		int countRow=reviewService.countRow(product_code);
		System.out.println("리뷰 갯수 : "+countRow);
		//전체 글의 갯수
		int countList=10;
		//페이지당 보여줄 글의 수 
		int pageList=5;
		//아래 보여줄 페이지의 수
		
		int maxPage=countRow/countList;
		//총 페이지 수
		if(countRow%countList>0){
			maxPage++;
			//맥스 페이지 보정
		}
		
		
		
		int startPage=((currentPage-1)/pageList)*pageList+1;
		//화면에 보여줄 시작페이지
		int endPage=startPage+pageList-1;
		
		if(endPage>maxPage){
			//마지막 페이지 보정
			endPage=maxPage;
		}
		
		int startRow=(currentPage-1)*countList+1;
		//현재 화면에서 보여줄 글의 시작 rownum
		int endRow=startRow+countList-1;
		//현재 화면에서 보여줄 글의 마지막 rownum
		
		HashMap map=new HashMap();
		map.put("product_code", product_code);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		ArrayList<Review> list=reviewService.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);
		
		return "review/reviewList";
	}
	
	
	//리뷰 디테일
	@RequestMapping(value="review.selectOne.do", method={RequestMethod.POST, RequestMethod.GET})
	public String selectOne(HttpServletRequest request, Model model){
		
		
		int review_no=Integer.parseInt(request.getParameter("review_no"));
		
		Review review=reviewService.selectOne(review_no);
		
		
		model.addAttribute("review", review);
		
		return "review/reviewDetail";
	}
}
