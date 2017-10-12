package com.kh.minimalist.auction.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.*;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.minimalist.auction.model.service.AuctionService;
import com.kh.minimalist.auction.model.vo.Auction;
import com.kh.minimalist.auction.model.vo.BidInfo;

@Controller
public class AuctionController {

	@Autowired
	private AuctionService auctionService; 
	
	
	//관리자 경매 등록 페이지 이동.
	@RequestMapping(value="auction.viewRegister.do", method={RequestMethod.POST, RequestMethod.GET})
		public String viewRegister(){
		
		return "manager/auctionRegister";
	}
		
	//경매 상품 등록.
	@RequestMapping(value="auction.insertAuction.do", method={RequestMethod.POST, RequestMethod.GET})
	public String insertAuction(HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam("img1") MultipartFile uploadFile1, 
			@RequestParam("img2") MultipartFile uploadFile2, 
			@RequestParam("img3") MultipartFile uploadFile3) throws IOException, ParseException{
		
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		//map에 업로드한 파일을 각각 저장.
		map.put("img1", uploadFile1);
		map.put("img2", uploadFile2);
		map.put("img3", uploadFile3);
		
		String auction_category=request.getParameter("auction_category");
		
		
		String savePath="C:\\workspace\\minimalist\\src\\main\\webapp\\resources\\img_auction";
		//파일저장을 위한 경로 설정.
		//File file=new File(savePath);
		

		String[] fileName=new String[map.size()];
		String[] reName=new String[map.size()];
		String[] fullPath=new String[map.size()];
		for(int i=0; i<map.size(); i++){
			//파일 경로 + 파일 이름을 통해 파일의 총 저장경로 결정.
			//파일이름은 카테고리 + 시간으로 변경
			String name="img"+(i+1);
			fileName[i]=((MultipartFile) map.get(name)).getOriginalFilename();
			SimpleDateFormat sdf = new SimpleDateFormat(auction_category+"yyyyMMddHHmmss"+i);
			reName[i] = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + fileName[i].substring(fileName[i].lastIndexOf(".") + 1);

			fullPath[i]=savePath+"\\"+reName[i];
		}
	
		try {
			BufferedOutputStream stream=null;
				for(int i=0; i<map.size(); i++){
					//파일 입출력을 통해 파일을 저장.
					String name="img"+(i+1);
					stream=new BufferedOutputStream(new FileOutputStream(new File(fullPath[i])));
					byte[] bytes=((MultipartFile) map.get(name)).getBytes();
					stream.write(bytes);
					stream.flush();
				}
				stream.close();
			
		} catch (Exception e) {
			
		}
		//db 저장용 객체 생성.
		Auction auction=new Auction();
		//객체에 값 넣기.
		auction.setAuction_name(request.getParameter("auction_name"));
		auction.setAuction_category(request.getParameter("auction_category"));
		auction.setAuction_brand(request.getParameter("auction_brand"));
		auction.setAuction_color(request.getParameter("auction_color"));
		auction.setAuction_descript(request.getParameter("auction_descript"));
		auction.setStart_price(Integer.parseInt(request.getParameter("start_price")));
		auction.setAuction_size(request.getParameter("auction_size"));
		
		Date start=Date.valueOf(request.getParameter("start_date"));
		Date end=Date.valueOf(request.getParameter("end_date"));
		auction.setStart_date(start);
		auction.setEnd_date(end);
		
		String img_path="";
		for(int i=0; i<map.size(); i++){
			if(i<map.size()-1){
				img_path+=reName[i]+",";
			}
			else if(i==map.size()-1){
				img_path+=reName[i];
			}
		}
		auction.setImage_path(img_path);
		
		
		
		int result=auctionService.insertAuction(auction);
		
		String tmp="";
		if(result>0){
			tmp="manager/auctionRegister";
		}else {
			tmp="main/404";
		}
		
		     return tmp;
	}
	
	
	@RequestMapping(value="auction.selectList.do", method={RequestMethod.POST, RequestMethod.GET})
	public String selectList(Model model ,HttpServletRequest request) throws UnsupportedEncodingException{
		
		
		
		String auction_category=null;
		//전체 검색인 경우.
		if(request.getParameter("auction_category")!=null){
			auction_category=request.getParameter("auction_category");
		}
		
		
		int currentPage=1;
		//현재 페이지
		
		if(request.getParameter("page")!=null){
			//현재 페이지 보정
				currentPage=Integer.parseInt(request.getParameter("page"));
		}
		
		int countRow=0;
		//전체 글의 갯수
		if(auction_category!=null){
			//특정 카테고리만 보여줄 경우
			countRow=auctionService.countRowCategory(auction_category);
		}else{
			countRow=auctionService.countRow();
		}
		
		
		int countList=6;
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
		
		if(auction_category!=null){
			map.put("auction_category", auction_category);
		}
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		ArrayList<Auction> list=null;
		if(auction_category!=null){
			list=auctionService.selectListAuctionCategory(map);
		}else {
			list=auctionService.selectList(map);
		}
		
		if(auction_category!=null){
			model.addAttribute("auction_category", auction_category);
		}
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);
		
		return "auction/auctionList";
	}
	
	@RequestMapping(value="auction.selectOne.do", method=RequestMethod.GET)
	public String selectOne(HttpServletRequest request, Model model){
		
		int auction_code=Integer.parseInt(request.getParameter("auction_code"));
		
		Auction auction=auctionService.selectOne(auction_code);
		
		
		model.addAttribute("auction", auction);
		
		return "auction/auctionDetail";
		
	}
	
	@RequestMapping(value="auction.bid.do", method=RequestMethod.POST)
	public void bid(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		int price=Integer.parseInt(request.getParameter("price"));
		String id=request.getParameter("id");
		int auction_code=Integer.parseInt(request.getParameter("code"));
		BidInfo bid=new BidInfo();
		
		bid.setBid_price(price);
		bid.setMember_id(id);
		bid.setAuction_code(auction_code);
		
		int result=auctionService.bid(bid);
		
		PrintWriter writer=response.getWriter();
		if(result>0){
			//정상 처리
			writer.append("yes");
			writer.flush();
		}else if(result==-1) {
			//재입찰인데 가격을 낮춘경우.
			writer.append("downPrice");
			writer.flush();
		}else if(result==-2) {
			//시작 가격보다 낮게 입찰한 경우
			writer.append("lowPrice");
			writer.flush();
		}else {
			//그 밖의 모든 경우
			writer.append("no3");
			writer.flush();
		}
		
		writer.close();
		
		
	}
	
	@RequestMapping(value="auction.reloadPrice.do", method={RequestMethod.GET,RequestMethod.POST})
	public void reloadPrice(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		int auction_code=Integer.parseInt(request.getParameter("auction_code"));
		
		int price=auctionService.reloadPrice(auction_code);
		
		PrintWriter writer=response.getWriter();
		if(price>0){
			
			writer.append(Integer.toString(price));
			writer.flush();
		}else {
			//에러페이지로 연결.
			
		}
		
		writer.close();
		
		
	}
	
	
	
	//
	@RequestMapping(value="auction.deleteAuction.do", method={RequestMethod.GET,RequestMethod.POST})
	public String deleteAuction(HttpServletRequest request){
		
		int auction_code=Integer.parseInt(request.getParameter("auction_code"));
		
		
		int result=auctionService.deleteAuction(auction_code);
	
		String tmp=null;
		
		if(result>0){
			tmp="redirect:auction.selectList.do";
		}else {
			tmp="main/404";
		}
		
		return tmp;
		
	}
	
	//경매 수정 뷰
	@RequestMapping(value="auction.viewUpdateForm.do", method={RequestMethod.GET,RequestMethod.POST})
	public String viewUpdateForm(HttpServletRequest request, Model model){
		
		int auction_code=Integer.parseInt(request.getParameter("auction_code"));
		
		Auction auction=auctionService.selectOne(auction_code);
		
		model.addAttribute("auction", auction);
		
		return "auction/auctionUpdate";
	}
	
		//경매 수정 하기
		@RequestMapping(value="auction.updateAuction.do", method={RequestMethod.POST, RequestMethod.GET})
		public String updateAuction(HttpServletRequest request, 
				HttpServletResponse response,
				@RequestParam("img1") MultipartFile uploadFile1, 
				@RequestParam("img2") MultipartFile uploadFile2, 
				@RequestParam("img3") MultipartFile uploadFile3,
				Model model) throws IOException, ParseException{
			
			
			
			
			int auction_code=Integer.parseInt(request.getParameter("auction_code"));
			
			Auction auction=new Auction();
			
			String temp=uploadFile1.getOriginalFilename();
			//사진이 등록되었는지 아닌지를 검사.
			
			//사진을 새로 등록한 경우에만. 
			if(temp.contains("jpg") || temp.contains("png") || temp.contains("gif")){
				HashMap<String, Object> map=new HashMap<String, Object>();
				//map에 업로드한 파일을 각각 저장.
				map.put("img1", uploadFile1);
				map.put("img2", uploadFile2);
				map.put("img3", uploadFile3);
				
				String auction_category=request.getParameter("auction_category");
				
				
				String savePath="C:\\workspace\\minimalist\\src\\main\\webapp\\resources\\img_auction";
				//파일저장을 위한 경로 설정.
				//File file=new File(savePath);
				

				String[] fileName=new String[map.size()];
				String[] reName=new String[map.size()];
				String[] fullPath=new String[map.size()];
				for(int i=0; i<map.size(); i++){
					//파일 경로 + 파일 이름을 통해 파일의 총 저장경로 결정.
					//파일이름은 카테고리 + 시간으로 변경
					String name="img"+(i+1);
					fileName[i]=((MultipartFile) map.get(name)).getOriginalFilename();
					SimpleDateFormat sdf = new SimpleDateFormat(auction_category+"yyyyMMddHHmmss"+i);
					reName[i] = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + fileName[i].substring(fileName[i].lastIndexOf(".") + 1);

					fullPath[i]=savePath+"\\"+reName[i];
				}
			
				try {
					BufferedOutputStream stream=null;
						for(int i=0; i<map.size(); i++){
							//파일 입출력을 통해 파일을 저장.
							String name="img"+(i+1);
							stream=new BufferedOutputStream(new FileOutputStream(new File(fullPath[i])));
							byte[] bytes=((MultipartFile) map.get(name)).getBytes();
							stream.write(bytes);
							stream.flush();
						}
						stream.close();
					
				} catch (Exception e) {
					
				}
				
				String img_path="";
				for(int i=0; i<map.size(); i++){
					if(i<map.size()-1){
						img_path+=reName[i]+",";
					}
					else if(i==map.size()-1){
						img_path+=reName[i];
					}
				}

				auction.setImage_path(img_path);
			}
			
			
			
			auction.setAuction_code(auction_code);
			//객체에 값 넣기.
			auction.setAuction_name(request.getParameter("auction_name"));
			auction.setAuction_category(request.getParameter("category"));
			auction.setAuction_brand(request.getParameter("auction_brand"));
			auction.setAuction_color(request.getParameter("auction_color"));
			auction.setAuction_descript(request.getParameter("auction_descript"));
			auction.setStart_price(Integer.parseInt(request.getParameter("start_price")));
			auction.setAuction_size(request.getParameter("auction_size"));
			
			Date start=Date.valueOf(request.getParameter("start_date"));
			Date end=Date.valueOf(request.getParameter("end_date"));
			auction.setStart_date(start);
			auction.setEnd_date(end);
			
			int result=auctionService.updateAuction(auction);
			
			String tmp="";
			if(result>0){
				model.addAttribute("auction_code", auction_code);
				tmp="redirect:auction.selectOne.do";
			}else {
				tmp="main/404";
			}
			
			     return tmp;
		}
	
		//종료된 경매 갯수 세기 + 종료된 경매 리스트
		//관리자 페이지 - 종료된 경매 낙찰자 확인 auction.viewAuctionEnd.do
		@RequestMapping(value="auction.viewAuctionEnd.do", method={RequestMethod.POST, RequestMethod.GET})
		public String viewEndAuction(HttpServletRequest request, Model model){
			
			
			int currentPage=1;
			//현재 페이지 - 초기값 1
			int countList=10;
			//한 페이지당 보여줄 글의 수
			int pageList=5;
			//아래 보여줄 페이지의 수
			
			
			if(request.getParameter("page")!=null){
				currentPage=Integer.parseInt(request.getParameter("page"));
				//넘겨받은 페이지값이 있는 경우 해당 페이지를 현재 페이지로 저장.
			}
			
			int totalRow=auctionService.countRowEnd();
			//전체 행 갯수 파악.
			
			int maxPage=totalRow/countList;
			//총 페이지 계산
			
			if(totalRow%countList>0){
				maxPage++;
				//만약 나머지값이 있는 경우 총페이지 + 1 추가.
			}
			
			int startPage=((currentPage-1)/pageList)*pageList+1;
			//현재 페이지를 기준으로 시작페이지를 계산.
			
			int endPage=startPage+pageList-1;
			//시작 페이지 값을 기준으로 현재 보여줄 마지막 페이지 계산.
			
			if(endPage>maxPage){
				endPage=maxPage;
				//만약 총 페이지 수를 넘어갈 경우 보정.
			}
			
			int startRow=(currentPage-1)*countList+1;
			int endRow=startRow+countList-1;
			//시작 row 및 끝 row 계산
			HashMap<String, Object> map=new HashMap<String, Object>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			ArrayList<Auction> list=auctionService.selectListEnd(map);
			
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("maxPage", maxPage);
			
			return "manager/viewEndAuction";
		}
		
		
		//종료된 경매 결제 확인
		@RequestMapping(value="auction.checkPayment.do", method={RequestMethod.POST, RequestMethod.GET})
		public void checkPayment(HttpServletRequest request, HttpServletResponse response) throws IOException{
			
			int auction_code=Integer.parseInt(request.getParameter("auction_code"));
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("auction_code", auction_code);
			String message=request.getParameter("message");
			map.put("message", message);
			
			int result=auctionService.checkPayment(map);
			
			PrintWriter writer=response.getWriter();
			
			if(result>0){
				writer.append("yes");
			}else {
				writer.append("no");
			}
			writer.flush();
			writer.close();
		}
		
		//입찰 취소~
		@RequestMapping(value="auction.deleteBid.do", method={RequestMethod.POST, RequestMethod.GET})
		public void deleteBid(HttpServletRequest request, HttpServletResponse response) throws IOException{
			
			int bid_price=Integer.parseInt(request.getParameter("bid_price"));
			
			int auction_code=Integer.parseInt(request.getParameter("auction_code"));
			
			BidInfo bid=new BidInfo();
			
			bid.setBid_price(bid_price);
			bid.setAuction_code(auction_code);
			
			int result=auctionService.deleteBid(bid);
			
			PrintWriter writer=response.getWriter();
			
			if(result>0){
				writer.append("yes");
				
			}else {
				writer.append("no");
			}
			
			writer.flush();
			writer.close();
	
		}
		
		//종료된 경매의 입찰정보 리스트 확인 - 관리자 열람
		@RequestMapping(value="auction.selectOneEnd.do", method={RequestMethod.POST, RequestMethod.GET})
		public String selectOneEnd(HttpServletRequest request, Model model){
			
			int auction_code=Integer.parseInt(request.getParameter("auction_code"));
			
			Auction auction=auctionService.selectOneEnd(auction_code);
			
				String tmp=null;
			if(auction!=null){
				model.addAttribute("auction", auction);
				tmp="manager/viewEndAuctionDetail";
				
			}else {
				tmp="main/404";
			}
			
			return tmp;
		}
		
		//경매 중지 - 악성 입찰자 잡기
		@RequestMapping(value="auction.auctionStop.do", method={RequestMethod.POST, RequestMethod.GET})
		public String auctionStop(HttpServletRequest request){
			
			int auction_code=Integer.parseInt(request.getParameter("auction_code"));
			
			int result=auctionService.auctionStop(auction_code);
			
			
			String tmp="";
			if(result>0){
				tmp="redirect:auction.selectList.do";
			}else {
				tmp="main/404";
			}
			
			return tmp;
		}
}
