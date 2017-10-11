package com.kh.minimalist.income.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.income.model.vo.Income;

@Repository("incomeDao")
public class IncomeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int countRow(){
		
		return sqlSession.selectOne("Income.countRow");
	}
	
	public ArrayList<Income> selectList(HashMap<String, Object> map){
		
		List<Income> list=null;
		
		list=sqlSession.selectList("Income.selectList", map);
		
		return (ArrayList<Income>)list;
	}
	
	public int insertIncome(Income income){
		
		
		int result=0;
		
		
		result=sqlSession.insert("Income.insertIncome", income);
			
		
		return result;
		
	}
	
	public int countRowByDate(HashMap<String, Object> map){
		
		return sqlSession.selectOne("Income.countRowByDate", map);
		
	}
	
	public ArrayList<Income> selectListByDate(HashMap<String, Object> map){
		
		List<Income> list=null;
		
		list=sqlSession.selectList("Income.selectListByDate", map);
		
		return (ArrayList<Income>)list;
	}

	public ArrayList<Income> selectMemberIncome(String member_id) {
		List<Income> list = sqlSession.selectList("Income.selectMemberIncome", member_id);
		return (ArrayList<Income>) list;
	}
}
