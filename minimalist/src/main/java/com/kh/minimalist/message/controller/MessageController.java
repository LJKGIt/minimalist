package com.kh.minimalist.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.minimalist.member.model.vo.Member;
import com.kh.minimalist.message.model.service.MessageService;
import com.kh.minimalist.message.model.vo.Message;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;

	/** Message List **/
	@RequestMapping(value = "mChkUpdate.do")
	public void messageChkUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Message message) {
		response.setContentType("text/plain; utf-8");

		int mNum = Integer.parseInt(request.getParameter("mNum"));
		messageService.updateMessageChk(mNum);
	}

	
	@RequestMapping(value = "message.messageDelete.do")
	public void messageDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int mNum = Integer.parseInt(request.getParameter("mNum"));
		
		int result = messageService.messageDelete(mNum);
		
		PrintWriter pw =  response.getWriter();
		if (result > 0) {
			pw.append("1");
		} else {
			pw.append("0");
		}
		pw.flush();
		pw.close();
		
	}
	

	@RequestMapping(value = "message.writeMessage.do")
	public String writeMessage(HttpServletRequest request, Message message) {

		String[] list = request.getParameter("mId_List").split(",");
		ArrayList<String> idList = new ArrayList<String>();
		for (int i = 0; i < list.length; i++) {
			idList.add(list[i]);
		}

		int result = messageService.insertMessage(idList, message);

		if (result > 0)
			return "manager/sendMessage";
		else
			return "main/404";

	}



	// 경매 낙찰자에 대해 쪽지보내기
	@RequestMapping(value = "message.endAuctionInsertMessage.do")
	public String endAuctionInsertMessage(HttpServletRequest request, Model model) {

		Message m = new Message();
		
		int auction_code=Integer.parseInt(request.getParameter("auction_code"));
		int price = Integer.parseInt(request.getParameter("bid_price"));
		String member_id = request.getParameter("member_id");

		m.setMember_id(member_id);
		
		String title="결제링크";
		
		String content="/income.viewOrder.do?auction_code="+auction_code+"&price="+price+"";
		
		m.setMessage_content(content);
		m.setMessage_title(title);

		int result = messageService.insertMessage2(m);
		String tmp = null;
		if (result > 0) {
			model.addAttribute("price", price);
			model.addAttribute("auction_code", auction_code);
			tmp = "redirect:auction.selectOneEnd.do";
		} else {
			tmp = "main/404";
		}

		return tmp;
	}


	@RequestMapping(value = "message.messageListView.do")
	public String messageList(Model model, HttpSession session, HttpServletRequest request) {
		
		int currentPage=1;
		//현재 페이지
		
		if(request.getParameter("page")!=null){
			//현재 페이지 보정
		
				currentPage=Integer.parseInt(request.getParameter("page"));
	
		}
		int countRow=messageService.countRow(((Member)session.getAttribute("member")).getMember_id());
		//전체 글의 갯수
		int countList=5;
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
		map.put("member_id", ((Member)session.getAttribute("member")).getMember_id());
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		ArrayList<Message> list = messageService.selectMessageList(map);
		
		model.addAttribute("messageList", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);
		
		
		return "member/messageView";
	}
	
	
	//경매 결제 취소
	@RequestMapping(value = "message.cancelOrder.do")
	public String cancelPay(HttpSession session, HttpServletRequest request){
		
		String id=((Member)session.getAttribute("member")).getMember_id();
		//발신자
		String auction_code=request.getParameter("auction_code");
		
		Message m=new Message();
		
		m.setMember_id("admin");
		m.setMessage_title("경매 결제 취소");
		
		String content=id+" 회원이 경매코드 "+auction_code+"에 대해 결제취소 하였습니다.";
		
		m.setMessage_content(content);
		
		int result=messageService.insertMessage2(m);
		
		String tmp=null;
		if(result>0){
			tmp="main/index";
		}else {
			tmp="main/404";
		}
		
		
		return tmp;
	}
	
}
