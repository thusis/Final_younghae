package com.kh.young.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
		
		
		//회원가입페이지
		@RequestMapping("enroll.me")
		   public String enroll() {
		      return "enroll";
		 }
		
		//로그인페이지
		@RequestMapping("login.me")
		   public String login() {
		      return "login";
		 }
		
		//아이디 찾기 페이지
		@RequestMapping("searchIdView.me")
		   public String searchIdView() {
		      return "searchIdView";
		 }
		
		//비밀번호 찾기 페이지
		@RequestMapping("searchPwdView.me")
		   public String searchPwdView() {
		      return "searchPwdView";
		 }
		
		//로그아웃
		@RequestMapping("logout.me")
		   public String logout() {
		      return "loginout";
		 }
}
