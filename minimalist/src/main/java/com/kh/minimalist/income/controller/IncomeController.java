package com.kh.minimalist.income.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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

import com.kh.minimalist.auction.model.service.AuctionService;
import com.kh.minimalist.auction.model.vo.Auction;
import com.kh.minimalist.income.model.service.IncomeService;
import com.kh.minimalist.income.model.vo.Income;
import com.kh.minimalist.member.model.vo.Member;

@Controller("Income")
public class IncomeController {

	@Autowired
	private IncomeService incomeService;
	@Autowired
	private AuctionService auctionService;
	
	//매출 전체 리스트~
	@RequestMapping(value="income.selectList.do", method={RequestMethod.POST, RequestMethod.GET})
	public String viewIncomePage(HttpServletRequest request,
			Model model){
		
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
		
		int totalRow=incomeService.countRow();
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
		
		ArrayList<Income> list=incomeService.selectList(map);
		
		
		
			//총 매출 집계.
			int total=0;
			for(Income inc : list){
				total+=inc.getIncome();
			}
			model.addAttribute("totalIncome", total);
			model.addAttribute("list", list);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			
	
			
		
		
		return "manager/income";
	}
	
	

	// 경매 결제 페이지 이동.
	@RequestMapping(value = "income.viewOrder.do")
	public String viewOrder(HttpSession session, HttpServletRequest request, Model model) {
		
		
		String name=((Member) session.getAttribute("member")).getMember_name();
		String address1=((Member) session.getAttribute("member")).getAddress1();
		String address2=((Member) session.getAttribute("member")).getAddress2();
		int auction_code = Integer.parseInt(request.getParameter("auction_code"));
		int price=Integer.parseInt(request.getParameter("price"));
		Auction auction=auctionService.selectOne(auction_code);
		model.addAttribute("auction", auction);
		model.addAttribute("price", price);
		model.addAttribute("name", name);
		model.addAttribute("address1", address1);
		model.addAttribute("address2", address2);
		return "order/auctionOrder";
	}

	// 매출 포함 - 경매
	@RequestMapping(value = "income.insertIncome.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void insertIncome(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Income inc=new Income();
		inc.setRequest(request.getParameter("request"));
		inc.setMember_id(((Member) session.getAttribute("member")).getMember_id());
		inc.setReceiver_name(request.getParameter("receiver"));
		inc.setReceiver_address(request.getParameter("address1")+" "+request.getParameter("address2"));
		int auction_code=Integer.parseInt(request.getParameter("auction_code"));
		int income=Integer.parseInt(request.getParameter("income"));
		inc.setAuction_code(auction_code);
		inc.setIncome(income);
		inc.setReceiver_phone(((Member) session.getAttribute("member")).getPhone());
		
		System.out.println(inc.toString());
		
		//매출에 집계.
		int result=incomeService.insertIncome(inc);
		
		PrintWriter writer=response.getWriter();
		
		if(result>0){
		
			writer.append("yes");
		}else {
			writer.append("no");
		}
		
		writer.flush();
		writer.close();
		
	}
	
	//매출 기간별 리스트~
	@RequestMapping(value="income.selectListByDate.do", method={RequestMethod.POST, RequestMethod.GET})
	public String selectListByDate(HttpServletRequest request,
			Model model){
		
		Date startDate=Date.valueOf(request.getParameter("startDate"));
		Date endDate=Date.valueOf(request.getParameter("endDate"));
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
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
		
		int totalRow=incomeService.countRowByDate(map);
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
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		ArrayList<Income> list=incomeService.selectListByDate(map);
		
		
		
			//총 매출 집계.
			int total=0;
			for(Income inc : list){
				total+=inc.getIncome();
			}
			model.addAttribute("totalIncome", total);
			model.addAttribute("list", list);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
			
		
		
		return "manager/income";
	}
	
	
	
	
	
}
