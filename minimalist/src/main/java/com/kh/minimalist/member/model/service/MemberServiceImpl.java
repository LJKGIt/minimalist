package com.kh.minimalist.member.model.service;

import com.kh.minimalist.member.model.dao.MemberDao;
import com.kh.minimalist.member.model.vo.Member;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
		
	@Override
	public Member loginMember(Member m) {
		return memberDao.selectMember(m);
	}

	@Override
	public int minsert(Member m) {
		return memberDao.insertMember(m);
	}

	@Override
	public int memberIdChk(String member_id) {
		return memberDao.selectId(member_id);
	}

	@Override
	public Member searchMember(String member_id) {
		
		return memberDao.searchMember(member_id);
	}

	@Override
	public ArrayList<Member> mList() {
		
		return memberDao.mList();
	}

	@Override
	public int mupdate(Member m) {
		return memberDao.mupdate(m);
	}

	@Override
	public int passwordUpdate(Member m) {
		return memberDao.passwordUpdate(m);
	}
	
}
