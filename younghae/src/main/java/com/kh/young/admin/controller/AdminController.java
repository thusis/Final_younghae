package com.kh.young.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    
    // 쿠폰
    @RequestMapping("couponCancer.ad")
    public String couponCancer(HttpSession session, Model model, Coupon C, @RequestParam("delConfirm") String delConfirm,
    		@RequestParam("couRegister") String couRegister) {
    	
    	int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("couRegister", couRegister);
    	map.put("id", id);
    	
    	int result = aService.alertCouponCa(map);

        return "adminCoupon";
    }
    
    // 쿠폰
    @RequestMapping("couponRegist.ad")
    public String couponRegist(HttpSession session, Model model, Coupon C, @RequestParam("delConfirm") String delConfirm,
    		@RequestParam("couRegister") String couRegister) {
    	
    	int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("couRegister", couRegister);
    	map.put("id", id);
    	
    	int result = aService.alertCouponRe(map);

        return "adminCoupon";
    }
    
    @RequestMapping("insertCoupon.ad")
    public String insertCoupon(HttpSession session, Model model, @ModelAttribute Coupon C) {
    	
    	//추천인코드자동부여
        String generatedString = RandomStringUtils.randomAlphanumeric(12);
        
        System.out.println(generatedString);

    	int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    	
    	if(C.getCouRegister().equals(null)||C.getCouRegister().equals("")) {
    		C.setCouRegister(generatedString);
    	}
    	C.setCouUsed("A");
    	if(C.getCouIntro().equals(null)||C.getCouIntro().equals("")) {
    		C.setCouIntro("임시발급쿠폰입니다.");
    	}
    	C.setUserNum(id);
    	
    	int result = aService.createCoupon(C);
    
        return "redirect:adminCoupon.ad";
    }
    

}
