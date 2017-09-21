package com.kh.minimalist.qna.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.minimalist.qna.model.vo.Qna;

public interface QnaService {

	
	int countRow();
	
	ArrayList<Qna> selectList(HashMap<String, Object> map);
	
	Qna selectOne(int qna_no);
	
	int addComment(Qna qna);
	
	int writeQna(Qna qna);
	
	int updateQna(Qna qna);
	
	int deleteQna(int qna_no);
	
	
}
