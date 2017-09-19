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
	
	public ArrayList<Income> selectList(HashMap map){
		
		List list=null;
		
		list=sqlSession.selectList("Income.selectList", map);
		
		return (ArrayList<Income>)list;
	}
}
