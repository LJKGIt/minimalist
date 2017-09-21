package com.kh.minimalist.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.minimalist.notice.model.vo.Notice;

public interface NoticeService {

	
	
	ArrayList<Notice> selectList(HashMap<String, Object> map);
	
	Notice selectOne(int notice_no);
	
	int countRow();
	
	int writeNotice(Notice notice);
	
	int updateNotice(Notice notice);
	
	int deleteNotice(int notice_no);
}
