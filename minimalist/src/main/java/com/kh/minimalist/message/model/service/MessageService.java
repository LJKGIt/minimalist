package com.kh.minimalist.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.minimalist.message.model.vo.Message;

public interface MessageService {

	int updateMessageChk(int mNum);

	int insertMessage(ArrayList<String> idList, Message message);


	int insertMessage2(Message m);

	int selectMessageCount(String member_id);

	int countRow(String member_id);

	ArrayList<Message> selectMessageList(HashMap<String, Object> map);

	int messageDelete(int mNum);


}
