package com.kh.minimalist.qna.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.qna.model.dao.QnaDao;
import com.kh.minimalist.qna.model.vo.Qna;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qnaDao;
	
	public int countRow() {
		
		return qnaDao.countRow();
	}

	@Override
	public ArrayList<Qna> selectList(HashMap<String, Object> map) {
		
		return qnaDao.selectList(map);
	}

	

	@Override
	public Qna selectOne(int qna_no) {
		
		return qnaDao.selectOne(qna_no);
	}

	@Override
	public int addComment(Qna qna) {
		
		return qnaDao.addComment(qna);
	}

	@Override
	public int writeQna(Qna qna) {
		
		return qnaDao.writeQna(qna);
	}

	@Override
	public int updateQna(Qna qna) {
		
		return qnaDao.updateQna(qna);
	}

	@Override
	public int deleteQna(int qna_no) {
		
		return qnaDao.deleteQna(qna_no);
	}

	

}
