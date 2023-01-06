package com.kh.young.event.service;

import java.util.HashMap;

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

	@Override
	public int attendanceAward(HashMap<String, Object> pointTable) {
		return eDAO.attendanceAward(sqlSession, pointTable);
	}

	@Override
	public int updatePoint(HashMap<String, Object> pointTable) {
		return eDAO.updatePoint(sqlSession, pointTable);
	}

	@Override
	public int insertCoupon(HashMap map) {
		return eDAO.insertCoupon(sqlSession, map);
	}

	@Override
	public int attendanceCheck(int userNum) {
		return eDAO.attendanceCheck(sqlSession, userNum);
	}

	@Override
	public int checkEvent(int userNum) {
		return eDAO.checkEvent(sqlSession, userNum);
	}
	
	//생일 쿠폰 지급내역 있는지 없는지 확인
	@Override
	public int birthCheck(int userNum) {
		return eDAO.birthCheck(sqlSession, userNum);
	}
	//출석이벤트 포인트 지급내역 있는지 없는지 확인
	@Override
	public int attAwardCheck(int userNum) {
		return eDAO.attAwardCheck(sqlSession, userNum);
	}




}
