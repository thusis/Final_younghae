package com.kh.young.event.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO {

	public int insertAttendance(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.insert("eventMapper.insertAttendance", userNum);
	}

	public int selectCountAttendance(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.selectOne("eventMapper.selectCountAttendance", userNum);
	}

	public int checkBirth(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.selectOne("eventMapper.checkBirth", userNum);
	}

	public int attendanceAward(SqlSessionTemplate sqlSession, HashMap<String, Object> pointTable) {
		return sqlSession.insert("eventMapper.attendanceAward", pointTable);
	}

	public int updatePoint(SqlSessionTemplate sqlSession, HashMap<String, Object> pointTable) {
		return sqlSession.insert("eventMapper.updatePoint", pointTable);
	}

	public int insertCoupon(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("eventMapper.insertCoupon", map);
	}

}
