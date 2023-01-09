package com.kh.young.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;

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

	public int createCoupon(SqlSessionTemplate sqlSession, Coupon c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.createCoupon", c);
	}

	public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllMember");
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectMember", id);
	}

	public ExpertUser selectExpert(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectExpert", id);
	}

	public GeneralUser selectGeneral(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectGeneral", id);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.deleteMember", id);
	}

	public int updateMember(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateMember", id);
	}
	

}
