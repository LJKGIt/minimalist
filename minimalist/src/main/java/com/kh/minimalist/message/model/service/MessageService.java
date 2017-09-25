package com.kh.minimalist.message.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.minimalist.message.model.vo.Message;

public interface MessageService {

	List<Message> selectMessageList(String member_id);
	
	int updateMessageChk(int mNum);

	int insertMessage(ArrayList<String> idList, Message message);

	int insertMessage2(Message m);
}
