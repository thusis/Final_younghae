package com.kh.young.supplement.service;

import java.util.ArrayList;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.ProCategory;
import com.kh.young.model.vo.Review;
import com.kh.young.model.vo.Supplement;

public interface ProCategoryService {

	int getListCount();

	ArrayList<ProCategory> allCategory(PageInfo pi);

	ProCategory selectCategory(int cateNum);

	ArrayList<Supplement> selectCateProduct(int cateNum);

	Supplement selectPro(int proNum);

	int insertReview(Review r);

	int insertReviewAttm(Attachment attm);

	Member selectMember(int i);

	Review checkReview(Review r);

}
