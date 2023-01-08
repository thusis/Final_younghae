package com.kh.young.supplement.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.model.vo.Review;
import com.kh.young.model.vo.ReviewAjax;
import com.kh.young.model.vo.Supplement;
import com.kh.young.supplement.dao.SupplementDAO;

@Service("sService")
public class SupplementServiceImpl implements SupplementService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private SupplementDAO pcDAO;

	@Override
	public int getListCount(int i) {
		int result = pcDAO.getListCount(sqlSession);
		System.out.println(result);
		return pcDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<ProCategory> allCategory(PageInfo pi) {
		return pcDAO.allCategory(sqlSession, pi);
	}

	@Override
	public ProCategory selectCategory(int cateNum) {
		return pcDAO.selectCategory(sqlSession, cateNum);
	}

	@Override
	public ArrayList<Supplement> selectCateProduct(int cateNum) {
		return pcDAO.selectCateProduct(sqlSession, cateNum);
	}

	@Override
	public Supplement selectPro(int proNum) {
		return pcDAO.selectPro(sqlSession, proNum);
	}

	@Override
	public int insertReview(Review r) {
		return pcDAO.insertReview(sqlSession, r);
	}

	@Override
	public int insertReviewAttm(Attachment attm) {
		return pcDAO.insertReviewAttm(sqlSession, attm);
	}

	@Override
	public Member selectMember(int i) {
		return pcDAO.selectMember(sqlSession, i);
	}

	@Override
	public Review checkReview(Review r) {
		return pcDAO.checkReview(sqlSession, r);
	}

	@Override
	public ArrayList<Review> reviewList(int proNum) {
		return pcDAO.reviewList(sqlSession, proNum);
	}

	@Override
	public Attachment imageSelect(int rvNum) {
		return pcDAO.imageSelect(sqlSession, rvNum);
	}

	@Override
	public int rateUpdate(Supplement product) {
		return pcDAO.rateUpdate(sqlSession, product);
	}

	@Override
	public ArrayList<Review> selectReview(int cateNum, PageInfo pi) {
		return pcDAO.selectReview(sqlSession, cateNum, pi);
	}

	@Override
	public int getReviewListCount(int cateNum) {
		return pcDAO.getReviewListCount(sqlSession, cateNum);
	}

	@Override
	public ArrayList<ProCategory> searchList(String search) {
		return pcDAO.searchList(sqlSession, search);
	}

	@Override
	public int insertReco(Review r) {
		return pcDAO.insertReco(sqlSession, r);
	}

	@Override
	public int deleteReco(Review r) {
		return pcDAO.deleteReco(sqlSession, r);
	}

	@Override
	public ArrayList<Review> adminReviewListN(PageInfo pi, int i) {
		return pcDAO.adminReviewListN(sqlSession, pi, i);
	}

	@Override
	public ArrayList<Review> adminReviewListNa(PageInfo pi, int i) {
		return pcDAO.adminReviewListNa(sqlSession, pi, i);
	}
	
	@Override
	public ArrayList<Review> adminReviewListG(PageInfo pi, int i) {
		return pcDAO.adminReviewListG(sqlSession, pi, i);
	}
	
	@Override
	public int adminReviewListCount() {
		return pcDAO.adminReviewListCount(sqlSession);
	}

	@Override
	public int updateReviewCount(Review r) {
		return pcDAO.updateReviewCount(sqlSession, r);
	}

	@Override
	public int deleteReviewCount(Review r) {
		return pcDAO.deleteReviewCount(sqlSession, r);
	}

	@Override
	public int insertProduct(Supplement supple) {
		return pcDAO.insertProduct(sqlSession, supple);
	}


}
