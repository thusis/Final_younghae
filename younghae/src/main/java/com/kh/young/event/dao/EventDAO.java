package com.kh.young.event.dao;

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

}
