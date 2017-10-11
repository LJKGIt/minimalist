package com.kh.minimalist.member.model.dao;

import com.kh.minimalist.member.model.vo.Member;

import java.util.ArrayList;
import java.util.HashMap;
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

	public int dormantMember(Member m) {
		return sqlSession.delete("Member.dormantMember", m);
	}

	public int chkDormant(String member_id) {
		return sqlSession.selectOne("Member.chkDormant", member_id);
	}
	
	public int memberCount(){
		return sqlSession.selectOne("Member.memberCount");
	}
	
	public ArrayList<Member> memberList(HashMap<String, Integer> map){
		List<Member> list=null;
		
		list=sqlSession.selectList("Member.memberSelectList", map);
				
		return (ArrayList<Member>)list;
	}
	
	public Member memberOne(String member_id){
		return sqlSession.selectOne("Member.memberOne", member_id);
	}
	
	public int updateGrade(Member m){
		return sqlSession.update("Member.updateGrade", m);
	}
	
	public int updateDorment(Member m){
		return sqlSession.update("Member.updateDormant", m);
	}
	
	public ArrayList<Member> searchingMember(String id){
		List<Member> list=null;
		
		list=sqlSession.selectList("Member.searchingMember", id);
		
		return (ArrayList<Member>)list;
	}
}
