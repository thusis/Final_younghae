package com.kh.young.shopping.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Supplement;

@Repository
public class ShoppingDAO {

	public ArrayList<Supplement> selectSupplementList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectSupplementList");
	}

	public ArrayList<Supplement> selectTrendList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectTrendList");
	}

	public ArrayList<Supplement> selectBestsellerList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectBestsellerList");
	}

	public Supplement selectDetail(SqlSessionTemplate sqlSession, int proNum) {
		return sqlSession.selectOne("shoppingMapper.selectDetail", proNum);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("shoppingMapper.selemetMember", i);
	}

	public ArrayList<GeneralUser> selectGu(SqlSessionTemplate sqlSession, int i) {
		return (ArrayList)sqlSession.selectList("shoppingMapper.selectGu",i);
	}

}
