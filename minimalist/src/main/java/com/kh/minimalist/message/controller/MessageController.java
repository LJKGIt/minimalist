package com.kh.minimalist.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.minimalist.member.controller.MemberController;
import com.kh.minimalist.message.model.service.MessageService;
import com.kh.minimalist.message.model.vo.Message;
import com.kh.minimalist.notice.model.vo.Notice;

@Controller
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
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
			return "manager/manageHome";
		else
			return "main/404";
		
	}
	
}
