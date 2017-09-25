package com.kh.minimalist.message.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.member.model.dao.MemberDao;
import com.kh.minimalist.message.model.dao.MessageDao;
import com.kh.minimalist.message.model.vo.Message;

@Service("messageService")
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDao messageDao;
	
	
	@Override
	public List selectMessageList(String member_id) {
		
		return messageDao.selectMessageList(member_id);
	}


	@Override
	public int updateMessageChk(int mNum) {
		return messageDao.updateMessageChk(mNum);
	}


	@Override
	public int insertMessage(ArrayList idList, Message message) {
		return messageDao.insertMessage(idList, message);
	}
	
	
}
