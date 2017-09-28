package com.kh.minimalist.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.member.model.vo.Member;
import com.kh.minimalist.message.model.vo.Message;


@Repository("messageDao")
public class MessageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateMessageChk(int mNum) {
		return sqlSession.update("Message.messageChkUpdate", mNum);
	}

	public int insertMessage(ArrayList idList, Message message) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("idList", idList);
		map.put("message", message);
		
		return sqlSession.insert("Message.messageInsert", map);
	}

	public int selectMessageCount(String member_id) {
		return sqlSession.selectOne("Message.messageCount", member_id);
	}

	public int countRow(String member_id) {
		return sqlSession.selectOne("Message.countRow", member_id);
	}

	public ArrayList<Message> selectMessageList(String member_id, HashMap<String, Integer> map) {
		RowBounds rowBounds = new RowBounds(map.get("startRow")-1, map.get("endRow"));
		return new ArrayList<Message>(sqlSession.selectList("Message.messageList", member_id, rowBounds));
	}

	public int messageDelete(int mNum) {
		return sqlSession.delete("Message.messageDelete", mNum);
	}
}
