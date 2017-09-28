package com.kh.minimalist.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.minimalist.message.model.vo.Message;

public interface MessageService {

	int updateMessageChk(int mNum);

	int insertMessage(ArrayList idList, Message message);

	int selectMessageCount(String member_id);

	int countRow(String member_id);

	ArrayList<Message> selectMessageList(String member_id, HashMap<String, Integer> map);

	int messageDelete(int mNum);

}
