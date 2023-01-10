package com.kh.young.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.young.admin.service.AdminService;
import com.kh.young.member.exception.MemberException;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Coupon;
import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.GeneralUser;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.myPage.service.MyPageService;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
    //전문가 페이지
    @RequestMapping("adminPage.ad")
    public String adminPage(HttpSession session, Model model) {
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	Date now = new Date();
    	String now_dt = format.format(now);
    	
    	model.addAttribute("Date",now_dt);
    	
    	int id = ((Member) session.getAttribute("loginUser")).getUserNum();
    	
    	ArrayList < Coupon > CL = aService.selectAdminCoupon(id);
    	
    	model.addAttribute("couponList",CL);
    	
    	ArrayList < Member > ML = aService.selectAllMember();
    	
    	model.addAttribute("memberList",ML);
    	
        return "adminPage";
    }
    
    //맴버 관리
    @RequestMapping("adminMember.ad")
    public String adminMember(Model model) {
    	
    	ArrayList < Member > ML = aService.selectAllMember();
    	
    	model.addAttribute("memberList",ML);
    	
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
    
    
 // 내 정보 이동.
    @RequestMapping("otherDetail.ad")
    public String otherDetail(HttpSession session, Model model, @RequestParam("id") int id) {
    	
    	Member m = aService.selectMember(id);
    	int sort = m.getUserCNumber();
    	if(sort==2) {
        	
            ExpertUser eu = aService.selectExpert(id);
            model.addAttribute("ExpertUser", eu);
            model.addAttribute("Member",m);
            return "adminMemberInfo";
    	}else {

    		GeneralUser gu = aService.selectGeneral(id);
    		
    		model.addAttribute("GeneralUser", gu);
    		model.addAttribute("Member",m);
    		return "adminMemberInfo";
    	}
    }
    
    //회원강제탈퇴
    @RequestMapping("deleteMember.ad")
    public String deleteMember(HttpSession session, Model model, @RequestParam("id") int id) {
    	
    	Member m = aService.selectMember(id);
        
    	int result = aService.deleteMember(id);

        return "redirect:adminMember.ad";
    }
    
    //회원복구
    @RequestMapping("updateMember.ad")
    public String updateMember(HttpSession session, Model model, @RequestParam("id") int id) {
    	
    	Member m = aService.selectMember(id);
        
    	int result = aService.updateMember(id);

        return "redirect:adminMember.ad";
    }
    
    //관리자인증
    @RequestMapping("confirmExpert.ad")
    public String confirmExpert(HttpSession session, Model model, @RequestParam("id") int id) {
    	
    	Member m = aService.selectMember(id);
        
    	Attachment attm = aService.selectProfile(id);
    	model.addAttribute("ExpertImage", attm);

        return "confirmExpert";
    }
    
    /**===============신고==========================**/
    @GetMapping("adminDeclare.ad")
    public String adminDeclare(@RequestParam(value="page", required=false) Integer page, Model model) {
       
       PageInfo pi = aService.getDeclarePageInfo(page);
       ArrayList<HashMap> list = aService.selectAdminDeclare(page);
       
       model.addAttribute("pi", pi);
       model.addAttribute("list", list);
       return "adminDeclare";
    }
    
    @PostMapping("deleteDeclaredBoard.ad")
    @ResponseBody
    public String deleteDeclaredBoard(HttpServletRequest request) {
       String[] parameter = request.getParameterValues("parameter");
       System.out.println(parameter);
       int result = 0;
       for(int i=0; i<parameter.length; i++) {
          String str = parameter[i];
          int boardNum = Integer.parseInt(str.split("-")[0]);
          int declNum = Integer.parseInt(str.split("-")[1]);
          result += aService.deleteDeclaredBoard(boardNum);
          result += aService.updateDeclareStatus(declNum);
       }
       System.out.println("admin컨트롤"+result);
       return String.valueOf(result);
    }
    
    
}
