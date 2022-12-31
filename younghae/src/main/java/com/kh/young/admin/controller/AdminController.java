package com.kh.young.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.young.admin.service.AdminService;


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
    
    @RequestMapping("adminMember.ad")
    public String adminMember(Model model) {
    	
    	
        return "adminMember";
    }
}
