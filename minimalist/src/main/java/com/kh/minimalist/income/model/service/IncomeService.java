package com.kh.minimalist.income.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.minimalist.income.model.vo.Income;

public interface IncomeService {

	
	int countRow();
	
	ArrayList<Income> selectList(HashMap map);
	
	int insertIncome(Income income);
	
	int countRowByDate(HashMap map);
	
	ArrayList<Income> selectListByDate(HashMap map);
	
}
