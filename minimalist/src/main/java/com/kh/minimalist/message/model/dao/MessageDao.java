package com.kh.minimalist.message.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.message.model.vo.Message;


@Repository("messageDao")
public class MessageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List selectMessageList(String member_id) {
		return sqlSession.selectList("Message.messageList", member_id);
	}

	public int updateMessageChk(int mNum) {
		return sqlSession.update("Message.messageChkUpdate", mNum);
	}

}
