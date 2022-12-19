package com.kh.young.supplement.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("pcDAO")
public class ProCategoryDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("supplementMapper.getListCount");
	}
	
}
