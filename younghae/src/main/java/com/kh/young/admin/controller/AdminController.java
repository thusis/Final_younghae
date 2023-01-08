package com.kh.young.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.young.admin.service.AdminService;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.Member;
import com.kh.young.myPage.service.MyPageService;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
    //전문가 페이지
    @RequestMapping("adminPage.ad")
    public String adminPage(Model model) {
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	Date now = new Date();
    	String now_dt = format.format(now);
    	
    	model.addAttribute("Date",now_dt);
    	
        return "adminPage";
    }
    
    //맴버 관리
    @RequestMapping("adminMember.ad")
    public String adminMember(Model model) {
    	
    	
        return "adminMember";
    }
    
    //쿠폰 관리
    @RequestMapping("adminCoupon.ad")
    public String adminCoupon(HttpSession session, Model model, Coupon C) {
    	
    	int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    	
    	ArrayList < Coupon > CL = aService.selectAdminCoupon(id);
    	
    	model.addAttribute("couponList",CL);
    	
    	
        return "adminCoupon";
    }
    
    @RequestMapping("couponCancer.ad")
    public String couponCancer(HttpSession session, Model model, Coupon C, @RequestParam("delConfirm") String delConfirm,
    		@RequestParam("couRegister") String couRegister) {
    	
    	int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("couRegister", couRegister);
    	map.put("id", id);
    	
    	System.out.println(couRegister);
    	System.out.println(delConfirm);
    	
    	int result = aService.alertCouponCa(map);
    	
    	System.out.println(result);
    	
        return "adminCoupon";
    }
    
    @RequestMapping("couponRegist.ad")
    public String couponRegist(HttpSession session, Model model, Coupon C, @RequestParam("delConfirm") String delConfirm,
    		@RequestParam("couRegister") String couRegister) {
    	
    	int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("couRegister", couRegister);
    	map.put("id", id);
    	
    	System.out.println(couRegister);
    	System.out.println(delConfirm);
    	
    	int result = aService.alertCouponRe(map);
    	
    	System.out.println(result);
    	
    	
        return "adminCoupon";
    }
    
}
