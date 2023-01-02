package com.kh.young.myPage.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Point;

public interface MyPageService {

	ExpertUser selectExpert(int id);

	int updateProfile(ExpertUser eu);

	GeneralUser selectGeneral(int id);

	int pointInsert(HashMap<String, Object> map);

	Point selectPoint(int id);

	ArrayList<Point> selectAllPoint(int id);

	int pointTotal(HashMap<String, Object> map);

	int deleteMember(int userNum);

	Member selectAllMember(int id);

}
