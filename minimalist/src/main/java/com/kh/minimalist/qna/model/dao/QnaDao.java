package com.kh.minimalist.qna.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.notice.model.vo.Notice;
import com.kh.minimalist.qna.model.vo.Qna;

@Repository("qnaDao")
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int countRow() {
		
		return sqlSession.selectOne("Qna.countRow");
	}

	public ArrayList<Qna> selectList(HashMap map) {
		
		List list=null;
		
		list=sqlSession.selectList("Qna.selectList", map);
		
		System.out.println("리스트 사이즈 : "+list.size());
		
		return (ArrayList<Qna>)list; 
	
	}

	public Qna selectOne(int qna_no) {
		
		return sqlSession.selectOne("Qna.selectOne", qna_no);
	}
	
	public int addComment(Qna qna){
		
		return sqlSession.update("Qna.addComment", qna);
	}

	public int writeQna(Qna qna){
		
		return sqlSession.insert("Qna.writeQna", qna);
	}
	
	public int updateQna(Qna qna){
		
		return sqlSession.update("Qna.updateQna", qna);
	}
	
	public int deleteQna(int qna_no){
		
		return sqlSession.delete("Qna.deleteQna", qna_no);
	}
}
