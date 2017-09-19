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
	
	public int insertIncome(Income income){
		//결제 조건 넣어야 함 상품코드 + 매출일자가 unique 제약조건임.
		
		int result=0;
		
		if(income.getAuction_code()!=0){
			int tmp=sqlSession.selectOne("Income.unique", income);
			
			if(tmp==0){
				result=sqlSession.insert("Income.insertIncome", income);
			}
		}
		
		return result;
		
	}
	
	public int countRowByDate(HashMap map){
		
		return sqlSession.selectOne("Income.countRowByDate", map);
		
	}
	
	public ArrayList<Income> selectListByDate(HashMap map){
		
		List list=null;
		
		list=sqlSession.selectList("Income.selectListByDate", map);
		
		return (ArrayList<Income>)list;
	}
}
