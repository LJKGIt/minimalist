package com.kh.minimalist.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.message.model.dao.MessageDao;
import com.kh.minimalist.message.model.vo.Message;

@Service("messageService")
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDao messageDao;
	
	

	@Override
	public int updateMessageChk(int mNum) {
		return messageDao.updateMessageChk(mNum);
	}


	@Override
	public int insertMessage(ArrayList idList, Message message) {
		return messageDao.insertMessage(idList, message);
	}


	@Override
	public int selectMessageCount(String member_id) {
		return messageDao.selectMessageCount(member_id);
	}


	@Override
	public ArrayList<Message> selectMessageList(String member_id, HashMap<String, Integer> map) {
		return messageDao.selectMessageList(member_id, map);
	}


	@Override
	public int countRow(String member_id) {
		return messageDao.countRow(member_id);
	}


	@Override
	public int messageDelete(int mNum) {
		return messageDao.messageDelete(mNum);
	}



	
}
