package com.kh.minimalist.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {

		@Autowired
		private SqlSessionTemplate sqlSession;
	
	//공지사항 리스트~
	public ArrayList<Notice> selectList(HashMap<String, Object> map){
		List<Notice> list=null;
		
		list=sqlSession.selectList("Notice.selectList", map);
		
		
		return (ArrayList<Notice>)list;
		
	}
	
	
	//공지사항 하나 보기

	public Notice selectOne(int notice_no) {
		
		return sqlSession.selectOne("Notice.selectOne", notice_no);
	}


	public int countRow() {
		
		return sqlSession.selectOne("Notice.countRow");
	}
	
	
	//공지사항 작성~
	
	public int writeNotice(Notice notice){
		
		return sqlSession.insert("Notice.insertNotice", notice);
	}
	
	//수정
	public int updateNotice(Notice notice){
		
		return sqlSession.update("Notice.updateNotice", notice);
	}
	
	//삭제
	public int deleteNotice(int notice_no){
		
		return sqlSession.delete("Notice.deleteNotice", notice_no);
	}
}
