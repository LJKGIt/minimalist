package com.kh.minimalist.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.message.model.vo.Message;


@Repository("messageDao")
public class MessageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Message> selectMessageList(String member_id) {
		return sqlSession.selectList("Message.messageList", member_id);
	}

	public int updateMessageChk(int mNum) {
		return sqlSession.update("Message.messageChkUpdate", mNum);
	}

	public int insertMessage(ArrayList idList, Message message) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("idList", idList);
		map.put("message", message);
		
		return sqlSession.insert("Message.messageInsert", map);
	}

	//경매 완료 쪽지
	public int insertMessage2(Message m){
		
		return sqlSession.insert("endAuctionMessage", m);
	}

}
