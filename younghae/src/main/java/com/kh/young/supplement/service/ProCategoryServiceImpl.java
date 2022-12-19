package com.kh.young.supplement.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.supplement.dao.ProCategoryDAO;

@Service("pcService")
public class ProCategoryServiceImpl implements ProCategoryService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProCategoryDAO pcDAO;
		
	@Override
	public int getListCount() {
		int result = pcDAO.getListCount(sqlSession);
		System.out.println(result);
		return pcDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<ProCategory> allCategory(PageInfo pi) {
		return pcDAO.allCategory(sqlSession, pi);
	}

	@Override
	public ProCategory selectCategory(int cateNum) {
		return pcDAO.selectCategory(sqlSession, cateNum);
	}
	
}
