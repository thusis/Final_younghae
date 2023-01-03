package com.kh.young.myPage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Point;
import com.kh.young.model.vo.Reply;
import com.kh.young.model.vo.Review;

@Repository("myDAO")
public class MyPageDAO {

	public ExpertUser selectExpert(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectExpert", id);
	}

	public int updateProfile(SqlSessionTemplate sqlSession, ExpertUser eu) {
		// TODO Auto-generated method stub
		return sqlSession.update("mypageMapper.updateProfile", eu);
	}

	public GeneralUser selectGeneral(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectGeneral", id);
	}

	public int pointInsert(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mypageMapper.pointInsert", map);
	}

	public Point selectPoint(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectPoint", id);
	}

	public ArrayList<Point> selectAllPoint(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAllPoint", id);
	}

	public int pointTotal(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("mypageMapper.pointTotal", map);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, int userNum) {
		// TODO Auto-generated method stub
		return sqlSession.update("mypageMapper.deleteMember", userNum);
	}
	
	public Member selectAllMember(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectAllMember", id);
	}

	public ArrayList<Coupon> selectAllCoupon(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAllCoupon", id);
	}

	public ArrayList<Coupon> selectAdminCoupon(SqlSessionTemplate sqlSession, String str) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAdminCoupon", str);
	}

	public int couponInsert(SqlSessionTemplate sqlSession, Coupon c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mypageMapper.couponInsert", c);
	}

	public ArrayList<Board> selectAllBoard(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAllBoard", id);
	}

	public ArrayList<Reply> selectAllReply(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAllReply", id);
	}

	public ArrayList<Review> selectAllReview(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectAllReview", id);
	}

}
