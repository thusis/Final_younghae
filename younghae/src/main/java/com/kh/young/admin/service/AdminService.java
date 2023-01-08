package com.kh.young.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.young.model.vo.Coupon;

public interface AdminService {

	ArrayList<Coupon> selectAdminCoupon(int id);

	int alertCouponCa(HashMap<String, Object> map);

	int alertCouponRe(HashMap<String, Object> map);

}
