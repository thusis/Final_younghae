package com.kh.young.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.admin.dao.AdminDAO;
import com.kh.young.model.vo.Coupon;
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
	
}
