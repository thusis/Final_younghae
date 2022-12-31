package com.kh.young.myPage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Point;

@Repository("myDAO")
public class MyPageDAO {

	public ExpertUser selectExpert(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectExpert", id);
	}

	public int updateProfile(SqlSessionTemplate sqlSession, ExpertUser eu) {
		// TODO Auto-generated method stub
		return sqlSession.update("mypageMapper.updateProfile", eu);
	}

	public GeneralUser selectGeneral(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectGeneral", id);
	}

	public int pointInsert(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mypageMapper.pointInsert", map);
	}

	public Point selectPoint(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectPoint", id);
	}

	public ArrayList<Point> selectAllPoint(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAllPoint", id);
	}

}
