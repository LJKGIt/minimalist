package com.kh.minimalist.income.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.minimalist.income.model.service.IncomeService;
import com.kh.minimalist.income.model.vo.Income;

@Controller("Income")
public class IncomeController {

	@Autowired
	private IncomeService incomeService;
	
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
		System.out.println("행갯수 : "+totalRow);
		
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
		HashMap map=new HashMap();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		ArrayList<Income> list=incomeService.selectList(map);
		
		System.out.println("리스트 사이즈 : "+list.size());
		String tmp;
		if(list!=null){
			model.addAttribute("list", list);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			tmp="manager/income";
		}else {
			tmp="main/404";
		}
		
		return tmp;
	}
	
	//매출 포함 - 경매
	@RequestMapping(value="income.insertIncome.do", method={RequestMethod.POST, RequestMethod.GET})
	public void insertIncome(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		
		int product_code;
		int auction_code;
		
		Income inc=new Income();
		
		//대여인 경우
		if(request.getParameter("product_code")!=null){
			product_code=Integer.parseInt(request.getParameter("product_code"));
			inc.setProduct_code(product_code);
			Date income_date=Date.valueOf(request.getParameter("income_date"));
			inc.setIncome_date(income_date);
		}
		//경매인 경우
		else if(request.getParameter("auction_code")!=null){
			auction_code=Integer.parseInt(request.getParameter("auction_code"));
			inc.setAuction_code(auction_code);
			//경매인 경우에는 집계 버튼을 눌렀을때 집계하므로. sysdate로 집계.
		}
		
		int income=Integer.parseInt(request.getParameter("income"));
		
		inc.setIncome(income);
		
		
		
		int result=incomeService.insertIncome(inc);
		
		PrintWriter writer=response.getWriter();
		
		if(result>0){
			writer.append("yes");
		} else {
			writer.append("no");
		}
		
		writer.flush();
		writer.close();
		
		
		
		
	}
}
