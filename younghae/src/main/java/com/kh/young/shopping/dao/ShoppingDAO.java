package com.kh.young.shopping.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Supplement;

@Repository
public class ShoppingDAO {

	public ArrayList<Supplement> selectSupplementList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectSupplementList");
	}

	public ArrayList<Supplement> selectTrendList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList(null);
	}

}
