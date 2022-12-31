package com.kh.young.event.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.event.dao.EventDAO;

@Service("eService")
public class EventServiceImpl implements EventService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EventDAO eDAO;

	@Override
	public int insertAttendance(int userNum) {

		return eDAO.insertAttendance(sqlSession, userNum);
	}

	@Override
	public int selectCountAttendance(int userNum) {
		return eDAO.selectCountAttendance(sqlSession, userNum);
	}

	@Override
	public int checkBirth(int userNum) {
		return eDAO.checkBirth(sqlSession, userNum);
	}

}
