package com.kh.minimalist.message.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.minimalist.message.model.service.MessageService;
import com.kh.minimalist.message.model.vo.Message;
import com.kh.minimalist.notice.model.vo.Notice;

@Controller
public class MessageController {
	
	
	@Autowired
	private MessageService messageService;

	/** Message List **/ 
	@RequestMapping(value = "mChkUpdate.do")
	public void messageChkUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response, Message message) {
		response.setContentType("text/plain; utf-8");
		
		int mNum = Integer.parseInt(request.getParameter("mNum"));
		messageService.updateMessageChk(mNum);
	}
	
	@RequestMapping(value = "message.writeMessage.do")
	public String writeMessage(HttpServletRequest request, Message message){
		
		String[] list = request.getParameter("mId_List").split(",");
		ArrayList idList = new ArrayList();
		for (int i=0; i<list.length; i++) {
			idList.add(list[i]);
		}
		
		int result = messageService.insertMessage(idList, message);
		
		if (result > 0)
			return "manager/sendMessage";
		else
			return "main/404";
		
	}
	
	
	//완료된 경매 결제 부탁 쪽지 보내는 경우.
	@RequestMapping(value="message.endAuctionMessage.do")
	public String endAuctionMessage(HttpServletRequest request, Model model){
		
		int auction_code=Integer.parseInt(request.getParameter("auction_code"));
		int income=Integer.parseInt(request.getParameter("income"));
		String member_id=request.getParameter("member_id");
		
		
		model.addAttribute("auction_code", auction_code);
		model.addAttribute("income", income);
		model.addAttribute("member_id", member_id);
		
		return "manager/endAuctionMessage";
	}
	
	//쪽지 저장
	@RequestMapping(value = "message.endAuctionInsertMessage.do")
	public String endAuctionInsertMessage(HttpServletRequest request, Message message){
		
		
		Message m=new Message();	
		
		m.setMember_id(request.getParameter("member_id"));
		m.setMessage_title(request.getParameter("message_title"));
		m.setMessage_content(request.getParameter("message_content"));
	
		int result=messageService.insertMessage2(m);
		String tmp=null;
		if (result > 0){
			
			tmp="manager/sendMessage";
		}
		else{
			tmp="main/404";
		}
		
		return tmp;
	}
	
}
