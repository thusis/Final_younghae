package com.kh.young.shopping.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.model.vo.Supplement;
import com.kh.young.shopping.dao.ShoppingDAO;

@Service("shService")
public class ShoppingServiceImpl implements ShoppingService{

	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	@Autowired
	private ShoppingDAO shDAO;
	
	@Override
	public ArrayList<Supplement> selectSupplementList() {
		return shDAO.selectSupplementList(sqlSession);
	}

	@Override
	public ArrayList<Supplement> selectTrendList() {
		return shDAO.selectTrendList(sqlSession);
	}

	@Override
	public ArrayList<Supplement> selectBestsellerList() {
		return shDAO.selectBestsellerList(sqlSession);
	}
	
	
	@Override
	public Supplement selectDetail(int proNum) {
		return shDAO.selectDetail(sqlSession, proNum);
	}
}
