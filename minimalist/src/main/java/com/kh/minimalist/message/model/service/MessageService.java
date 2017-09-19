package com.kh.minimalist.message.model.service;

import java.util.List;

public interface MessageService {

	List selectMessageList(String member_id);
	
	int updateMessageChk(int mNum);

}
