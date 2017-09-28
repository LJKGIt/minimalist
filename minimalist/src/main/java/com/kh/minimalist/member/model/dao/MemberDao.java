package com.kh.minimalist.member.model.dao;

import com.kh.minimalist.member.model.vo.Member;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemberDao(){}
	
	public Member selectMember(Member m) {
		return sqlSession.selectOne("Member.loginCheck", m);
	}

	public int selectId(String member_id) {
		return sqlSession.selectOne("Member.idChk", member_id);
	}

	public int insertMember(Member m) {
		System.out.println("다오 : " + m);
		return sqlSession.insert("Member.mInsert", m);
	}
	
	public Member searchMember(String member_id){
		
		return sqlSession.selectOne("Member.searchMember", member_id);
	}

	public ArrayList<Member> mList() {
		List<Member> list = sqlSession.selectList("Member.memberList");
		
		return (ArrayList<Member>) list;
	}

	public int mupdate(Member m) {
		return sqlSession.update("Member.updateMember", m);
	}

	public int passwordUpdate(Member m) {
		return sqlSession.update("Member.passwordUpdate", m);
	}

	public int deleteMember(Member m) {
		return sqlSession.delete("Member.deleteMember", m);
	}
}
