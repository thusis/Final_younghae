package com.kh.young.supplement.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.supplement.dao.ProCategoryDAO;

@Service("pcService")
public class ProCategoryServiceImpl implements ProCategoryService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProCategoryDAO pcDAO;
		
	@Override
	public int getListCount() {
		return pcDAO.getListCount(sqlSession);
	}
	
}
