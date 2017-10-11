package com.kh.minimalist.review.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.minimalist.member.model.vo.Member;
import com.kh.minimalist.product.model.service.ProductService;
import com.kh.minimalist.product.model.vo.Product;
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
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("product_code", product_code);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		ArrayList<Review> list=reviewService.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("product_code", product_code);
		
		Product p=new Product();
		p.setProduct_code(product_code);
		
		Product product=productService.productDetail(p);
		
		model.addAttribute("product", product);
		
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
	
	
	//리뷰 작성 폼 이동
	@RequestMapping(value="review.viewWriteForm.do")
	public String viewWriteForm(HttpServletRequest request, Model model){
		
		int product_code=Integer.parseInt(request.getParameter("product_code"));
		
		model.addAttribute("product_code", product_code);
		
		return "review/writeForm";
	}
	
	
	//리뷰 작성.
	@RequestMapping(value="review.insertReview.do", method={RequestMethod.POST, RequestMethod.GET})
	public String insertReview(HttpServletRequest request,
		@RequestParam("cnslFile") MultipartFile uploadFile, Model model
		) throws UnsupportedEncodingException{
	
	
	int product_code=Integer.parseInt(request.getParameter("product_code"));
	String member_id=request.getParameter("member_id");
	String review_title=request.getParameter("review_title");
	String review_content=request.getParameter("review_content");
	int review_rating=Integer.parseInt(request.getParameter("review_rating"));
	
	
	Review review=new Review();

	review.setProduct_code(product_code);
	review.setMember_id(member_id);
	review.setReview_title(review_title);
	review.setReview_content(review_content);
	review.setReview_rating(review_rating);
	
	
	//사진처리
	
	String fileName=uploadFile.getOriginalFilename();
	
	
	if(fileName.contains("jpg") || fileName.contains("png") || fileName.contains("gif")){
		String savePath="C:\\workspace\\minimalist\\src\\main\\webapp\\resources\\img_review";
		//파일저장을 위한 경로 설정.
		//File file=new File(savePath);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String reName=member_id+sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
		String fullPath=savePath+"\\"+reName;

	try {
		BufferedOutputStream stream=null;
			
				//파일 입출력을 통해 파일을 저장.
				
				stream=new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
				byte[] bytes=uploadFile.getBytes();
				stream.write(bytes);
				stream.flush();
			
			stream.close();
			
			//객체에 이미지명 저장.
			review.setImage_path(reName);
		
	} catch (Exception e) {
		
	}
	
	}//if 끝
	
	int result=reviewService.insertReview(review);
	
	String tmp="";
	
	if(result>0){
		model.addAttribute("product_code", product_code);
		tmp="redirect:review.selectList.do";
	}else {
		tmp="main/404";
	}
	
	return tmp;
	
	
	}
	
	//리뷰 수정 폼 이동
	@RequestMapping(value="review.updateForm.do")
	public String reviewUpdateForm(HttpServletRequest request, Model model){
		
		int review_no=Integer.parseInt(request.getParameter("review_no"));
		
		Review review=reviewService.selectOne(review_no);
		
		model.addAttribute("review", review);
		
		return "review/updateForm";
	}
	
	//리뷰 수정
	@RequestMapping(value="review.updateReview.do", method={RequestMethod.POST, RequestMethod.GET})
	public String updateReview(HttpServletRequest request, 
			@RequestParam("cnslFile") MultipartFile uploadFile,
			Model model){
		
		Review review=new Review();
		
		String member_id=request.getParameter("member_id");
		int review_no=Integer.parseInt(request.getParameter("review_no"));
		String review_title=request.getParameter("review_title");
		String review_content=request.getParameter("review_content");
		int review_rating=Integer.parseInt(request.getParameter("review_rating"));
		
		review.setReview_title(review_title);
		review.setReview_no(review_no);
		review.setReview_content(review_content);
		review.setReview_rating(review_rating);
		
		
		
		
		String temp=uploadFile.getOriginalFilename();
		
		if(temp.contains("jpg") || temp.contains("png") || temp.contains("gif")){
	
		String savePath="C:\\workspace\\minimalist\\src\\main\\webapp\\resources\\img_qna";
		//파일저장을 위한 경로 설정.
	//	File file=new File(savePath);
		

		String fileName=uploadFile.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String reName=member_id+sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
		String fullPath=savePath+"\\"+reName;
	
		try {
			BufferedOutputStream stream=null;
				
					//파일 입출력을 통해 파일을 저장.
					
					stream=new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
					byte[] bytes=uploadFile.getBytes();
					stream.write(bytes);
					stream.flush();
				
				stream.close();
				
				review.setImage_path(reName);
				//이미지 db에 저장.
		} catch (Exception e) {
			
		}
		
		
		}
		int result=reviewService.updateReview(review);
		
		String tmp=null;
		
		if(result>0){
			model.addAttribute("review_no", review_no);
			tmp="redirect:review.selectOne.do";
		}else {
			tmp="main/404";
		}
		
		return tmp;
	}
	
	//리뷰 삭제.review.deleteReview.do
	@RequestMapping(value="review.deleteReview.do", method={RequestMethod.POST, RequestMethod.GET})
	public String deleteReview(HttpServletRequest request, Model model){
		
		
		
		int review_no=Integer.parseInt(request.getParameter("review_no"));
		int product_code=Integer.parseInt(request.getParameter("product_code"));
		
		
		int result=reviewService.deleteReview(review_no);
		
		String tmp=null;
		
		if(result>0){
			model.addAttribute("product_code", product_code);
			tmp="redirect:review.selectList.do";
		}else {
			tmp="main/404";
		}
		
		return tmp;
		
	}
	
	@RequestMapping("review.myReview.do")
	public String myReview(HttpSession session, Model model){
		String result = "main/404";
		Member member = (Member) session.getAttribute("member");
		
		if(member != null){
			ArrayList<Review> list = reviewService.myReview(member.getMember_id());
			result = "mypage/customer-review";
			model.addAttribute("reviewList", list);
		}
		
		return result;
	}
	
}
