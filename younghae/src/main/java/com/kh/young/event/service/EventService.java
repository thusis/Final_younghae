package com.kh.young.event.service;

public interface EventService {

	int insertAttendance(int userNum);

	int selectCountAttendance(int userNum);

	int checkBirth(int userNum);

}
