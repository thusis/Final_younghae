package com.kh.young.event.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("eDAO")
public class EventDAO {

	public int insertAttendance(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.insert("eventMapper.insertAttendance", userNum);
	}

	public int selectCountAttendance(SqlSessionTemplate sqlSession, int userNum) {
		System.out.println(sqlSession);
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

	public int attendanceCheck(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.selectOne("eventMapper.attendanceCheck", userNum);
	}

	public int checkEvent(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.selectOne("eventMapper.checkEvent", userNum);
	}

	public int birthCheck(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.selectOne("eventMapper.birthCheck", userNum);
	}

	public int attAwardCheck(SqlSessionTemplate sqlSession, int userNum) {
		return sqlSession.selectOne("eventMapper.attAwardCheck", userNum);
	}

}
