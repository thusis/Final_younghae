package com.kh.young.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.young.member.service.MemberService;

@Controller
public class MemberController {
		
	@Autowired
	private MemberService mService;
		
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
		
		
		// 아이디 중복검사
		@RequestMapping("checkId.me")
		@ResponseBody
		public String checkId(@RequestParam("id") String id) {
			
			int count = mService.checkId(id);
			
			String result = count == 0? "yes" : "no";
			
			return result;
		}
		
		// 닉네임 중복검사
		@RequestMapping("checkNickName.me")
		@ResponseBody
		public String checkNickName(@RequestParam("nickName") String nickName) {
			int count = mService.checkNickName(nickName);
			
			String result = count == 0 ? "yes" : "no";
			
			return result;
		}	

}
