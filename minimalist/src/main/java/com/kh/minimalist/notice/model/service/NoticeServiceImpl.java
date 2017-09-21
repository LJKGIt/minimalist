package com.kh.minimalist.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.notice.model.dao.NoticeDao;
import com.kh.minimalist.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public ArrayList<Notice> selectList(HashMap<String, Object> map) {
	
		return noticeDao.selectList(map);
	}

	@Override
	public Notice selectOne(int notice_no) {
		
		return noticeDao.selectOne(notice_no);
	}

	@Override
	public int countRow() {
		
		
		return noticeDao.countRow();
	}

	@Override
	public int writeNotice(Notice notice) {
		
		return noticeDao.writeNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		
		return noticeDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int notice_no) {
		
		return noticeDao.deleteNotice(notice_no);
	}

	

}
