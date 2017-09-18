package com.kh.minimalist.member.model.service;

import com.kh.minimalist.member.model.vo.Member;

public interface MemberService {
	Member loginMember (Member m);

	int minsert(Member m);
	
	int memberIdChk (String member_id);
	
	Member searchMember(String member_id);
}
