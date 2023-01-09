package com.kh.young.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.admin.dao.AdminDAO;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.myPage.dao.MyPageDAO;

@Service("aService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDAO aDAO;
	
	@Override
	public ArrayList<Coupon> selectAdminCoupon(int id) {
		return aDAO.selectAdminCoupon(sqlSession, id);
	}
	
	@Override
	public int alertCouponCa(HashMap<String, Object> map) {
		return aDAO.alertCouponCa(sqlSession, map);
	}
	
	@Override
	public int alertCouponRe(HashMap<String, Object> map) {
		return aDAO.alertCouponRe(sqlSession, map);
	}
	
	@Override
	public int createCoupon(Coupon c) {
		return aDAO.createCoupon(sqlSession, c);
	}
	
	@Override
	public ArrayList<Member> selectAllMember() {
		return aDAO.selectAllMember(sqlSession);
	}
	
	@Override
	public Member selectMember(int id) {
		return aDAO.selectMember(sqlSession,id);
	}
	
	@Override
	public ExpertUser selectExpert(int id) {
		return aDAO.selectExpert(sqlSession,id);
	}
	
	@Override
	public GeneralUser selectGeneral(int id) {
		return aDAO.selectGeneral(sqlSession,id);
	}
	
	@Override
	public int deleteMember(int id) {
		return aDAO.deleteMember(sqlSession,id);
	}
	
	@Override
	public int updateMember(int id) {
		return aDAO.updateMember(sqlSession,id);
	}
	
	@Override
	public Attachment selectProfile(int id) {
		return aDAO.selectProfile(sqlSession,id);
	}
	
}
