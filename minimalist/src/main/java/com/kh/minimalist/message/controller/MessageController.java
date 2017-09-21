package com.kh.minimalist.message.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.minimalist.message.model.service.MessageService;

@Controller
public class MessageController {
	
	
	@Autowired
	private MessageService messageService;

	/** Message List **/ 
	@RequestMapping(value = "mChkUpdate.do")
	public void messageChkUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/plain; utf-8");
		
		int mNum = Integer.parseInt(request.getParameter("mNum"));
		messageService.updateMessageChk(mNum);
	}
	
}
