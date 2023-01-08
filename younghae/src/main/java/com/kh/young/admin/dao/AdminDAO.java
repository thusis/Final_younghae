package com.kh.young.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Coupon;

@Repository
public class AdminDAO {

	public ArrayList<Coupon> selectAdminCoupon(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectAdminCoupon", id);
	}

	public int alertCouponCa(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.update("adminMapper.alertCouponCa", map);
	}

	public int alertCouponRe(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("adminMapper.alertCouponRe", map);
		
	}

}
