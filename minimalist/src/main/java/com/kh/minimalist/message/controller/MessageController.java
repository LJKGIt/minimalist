package com.kh.minimalist.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String endAuctionInsertMessage(HttpServletRequest request) {

		Message m = new Message();
		
		int auction_code=Integer.parseInt(request.getParameter("auction_code"));
		int income = Integer.parseInt(request.getParameter("income"));
		String member_id = request.getParameter("member_id");

		m.setMember_id(member_id);
		
		String title="결제링크";
		
		String content="/income.viewOrder.do?auction_code="+auction_code+"&income="+income+"";
		
		m.setMessage_content(content);
		m.setMessage_title(title);

		int result = messageService.insertMessage2(m);
		String tmp = null;
		if (result > 0) {

			tmp = "redirect:auction.viewAuctionEnd.do";
		} else {
			tmp = "main/404";
		}

		return tmp;
	}

}
