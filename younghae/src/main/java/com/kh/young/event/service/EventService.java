package com.kh.young.event.service;

import java.util.HashMap;

public interface EventService {

	int insertAttendance(int userNum);

	int selectCountAttendance(int userNum);

	int checkBirth(int userNum);

	int attendanceAward(HashMap<String, Object> pointTable);

	int updatePoint(HashMap<String, Object> pointTable);

	int insertCoupon(HashMap<String, Object> map);

	int attendanceCheck(int userNum);

	int checkEvent(int userNum);

	int birthCheck(int userNum);

	int attAwardCheck(int userNum);




}
