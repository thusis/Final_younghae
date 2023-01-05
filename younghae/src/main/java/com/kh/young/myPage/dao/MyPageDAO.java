package com.kh.young.myPage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Point;
import com.kh.young.model.vo.Reply;
import com.kh.young.model.vo.Review;
import com.kh.young.model.vo.Supplement;
import com.kh.young.myPage.dto.ScrapDto;

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

	public ArrayList<Supplement> seletAllzzim(SqlSessionTemplate sqlSession, PageInfo pi, int id) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.seletAllzzim", id, rowBounds);
	}

	public int getListCountZZim(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.getListCountZZim", id);
	}

	public int getListCountScrap(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.getListCountScrap", id);
	}

	public ArrayList<ScrapDto> seletAllScrap(SqlSessionTemplate sqlSession, PageInfo pi, int id) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.seletAllScrap", id, rowBounds);
	}

	public int insertExpertAttm(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mypageMapper.insertExpertAttm", map);
	}

	public void removeImage(SqlSessionTemplate sqlSession, int id) {
		sqlSession.update("mypageMapper.removeImage", id);
		
	}

	public Attachment selectProfile(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectProfile", id);
	}

}
