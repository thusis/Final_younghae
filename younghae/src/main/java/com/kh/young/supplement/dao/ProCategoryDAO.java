package com.kh.young.supplement.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class ProCategoryDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("supplementMapper.getListCount");
	}
	
}
