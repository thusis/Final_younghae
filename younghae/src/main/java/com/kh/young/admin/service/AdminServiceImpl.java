package com.kh.young.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.admin.dao.AdminDAO;
import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
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
	
	  /**===============신고==========================**/
	   @Override
	   public ArrayList<HashMap> selectAdminDeclare(Integer page) {
	      PageInfo pi = getDeclarePageInfo(page);
	      ArrayList<HashMap> declareList = aDAO.selectAdminDeclare(sqlSession, pi);
	      for(HashMap<String, Object> map :declareList) {
	         Board b = (Board)map.get("board");
	         b.setBoardContent(
	               boardContentToString(b.getBoardContent())
	         );
	         map.put("board", b);
	      }
	      
	      return declareList;
	   }

	   @Override
	   public PageInfo getDeclarePageInfo(Integer page) {
	      int listCount = aDAO.getDeclareListCount(sqlSession);
	      int currentPage = 1;
	      if(page!=null) {
	         currentPage=page;
	      }
	      return Pagination.getPageInfo(currentPage, listCount, 10);
	   }
	   
	   
	   private String boardContentToString(String boardContent) {
	      String str = boardContent;
	      String newStr = str.replaceAll("<[^>]*>", " ");
	      return newStr;
	   }

	   @Override
	   public int deleteDeclaredBoard(int boardNum) {
	      return aDAO.deleteDeclaredBoard(sqlSession, boardNum);
	   }

	   @Override
	   public int updateDeclareStatus(int declNum) {
	      return aDAO.updateDeclareStatus(sqlSession, declNum);
	   }
	
}
