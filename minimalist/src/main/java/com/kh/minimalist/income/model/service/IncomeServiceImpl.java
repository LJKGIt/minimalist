package com.kh.minimalist.income.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minimalist.income.model.dao.IncomeDao;
import com.kh.minimalist.income.model.vo.Income;

@Service("incomeService")
public class IncomeServiceImpl implements IncomeService {

	@Autowired
	private IncomeDao incomeDao;

	@Override
	public int countRow() {
		
		return incomeDao.countRow();
	}

	@Override
	public ArrayList<Income> selectList(HashMap map) {
		
		return incomeDao.selectList(map);
	}

	@Override
	public int insertIncome(Income income) {
		
		return incomeDao.insertIncome(income);
	}

	@Override
	public int countRowByDate(HashMap map) {
		
		return incomeDao.countRowByDate(map);
	}

	@Override
	public ArrayList<Income> selectListByDate(HashMap map) {
		
		return incomeDao.selectListByDate(map);
	}
}