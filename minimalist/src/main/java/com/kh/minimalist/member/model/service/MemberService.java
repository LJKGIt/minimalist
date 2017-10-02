package com.kh.minimalist.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.minimalist.member.model.vo.Member;

public interface MemberService {
	Member loginMember (Member m);

	int minsert(Member m);
	
	int memberIdChk (String member_id);
	
	Member searchMember(String member_id);

	ArrayList<Member> mList();

	int mupdate(Member m);
	
	int passwordUpdate(Member m);

	int dormantMember(Member m);
	
	int memberCount();
	
	ArrayList<Member> memberList(HashMap<String, Integer> map);
	
	Member memberOne(String member_id);
	
	int updateGrade(Member m);
	
	int updateDormant(Member m);
	
	ArrayList<Member> searchingMember(String id);
}
