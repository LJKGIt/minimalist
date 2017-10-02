package com.kh.minimalist.member.model.service;

import com.kh.minimalist.member.model.dao.MemberDao;
import com.kh.minimalist.member.model.vo.Member;

import java.util.ArrayList;
import java.util.HashMap;

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

	@Override
	public int dormantMember(Member m) {
		return memberDao.dormantMember(m);
	}

	@Override
	public int memberCount() {
		return memberDao.memberCount();
	}

	@Override
	public ArrayList<Member> memberList(HashMap<String, Integer> map) {
		return memberDao.memberList(map);
	}

	@Override
	public Member memberOne(String member_id) {
		return memberDao.memberOne(member_id);
	}

	@Override
	public int updateGrade(Member m) {
		return memberDao.updateGrade(m);
	}

	@Override
	public int updateDormant(Member m) {
		return memberDao.updateDorment(m);
	}

	@Override
	public ArrayList<Member> searchingMember(String id) {
		return memberDao.searchingMember(id);
	}
	
}
