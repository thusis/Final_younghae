package com.kh.young.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;

public interface AdminService {

	ArrayList<Coupon> selectAdminCoupon(int id);

	int alertCouponCa(HashMap<String, Object> map);

	int alertCouponRe(HashMap<String, Object> map);

	int createCoupon(Coupon c);

	ArrayList<Member> selectAllMember();

	Member selectMember(int id);

	ExpertUser selectExpert(int id);

	GeneralUser selectGeneral(int id);

	int deleteMember(int id);

	int updateMember(int id);

	Attachment selectProfile(int id);
	
    /**===============신고==========================**/

   ArrayList<HashMap> selectAdminDeclare(Integer page);

   int deleteDeclaredBoard(int boardNum);

   int updateDeclareStatus(int declNum);

   PageInfo getDeclarePageInfo(Integer page);

}
