package com.kh.young.member.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.young.member.exception.MemberException;
import com.kh.young.member.service.KakaoService;
import com.kh.young.member.service.MemberService;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Point;
import com.kh.young.myPage.service.MyPageService;

@SessionAttributes({"loginUser", "access_Token"})
@Controller
public class MemberController {

    @Autowired
    private MemberService mService;


    @Autowired
    private BCryptPasswordEncoder bcrypt;

    @Autowired
    private KakaoService kService;
    
    //카카오 로그인
    @RequestMapping(value = "kakaoLogin.me", method = RequestMethod.GET)
    //  카카오 developer에서 보내준 code를 받아올 수 있는 redirect 주소를 받아줌.  
    public String kakaoLogin(@RequestParam("code") String code, /*HttpSession session,*/ Model model) {
        //	     코드를 잘 받아왔는지 확인
        String access_Token = kService.getAcessToken(code); // 코드보내고 토큰값 얻어오기
        HashMap < String, Object > userInfo = kService.getUserInfo(access_Token);
        String generatedString = RandomStringUtils.randomAlphanumeric(6);
        String generatedString2 = RandomStringUtils.randomAlphanumeric(3);

        Member mem = new Member();


        mem.setUserId((String) userInfo.get("kakao_id"));
        mem.setUserName((String) userInfo.get("nickname"));
        mem.setUserNickname((String) userInfo.get("nickname") + "#" + generatedString2);
        mem.setEmail((String) userInfo.get("email"));
        String str = (String) userInfo.get("gender");
        if (str.equals("false")) {
            mem.setGender("N");
        } else if (str.equals("male")) {
            mem.setGender("M");
        } else {
            mem.setGender("F");
        }

        String day = "1999-01-01"; // 형식을 지켜야 함
        java.sql.Date d = java.sql.Date.valueOf(day);
        mem.setUserBirth(d);
        mem.setUserPhone("01012341234");
        mem.setUserRecommend(generatedString);
        mem.setUserCNumber(1);

        if (mService.checkId((String) userInfo.get("kakao_id")) > 0) {
            mem.setUserPwd((String) userInfo.get("kakao_id"));
        } else {
            mem.setUserPwd(bcrypt.encode((String) userInfo.get("kakao_id")));
            mService.insertMember(mem);
            mem.setUserPwd((String) userInfo.get("kakao_id"));
        }

        Member loginUser = mService.login(mem);

        System.out.println("로그인카카오 : " + loginUser);
        if (loginUser != null) {
            if (bcrypt.matches(mem.getUserPwd(), loginUser.getUserPwd())) {
                model.addAttribute("loginUser", loginUser);
                return "redirect:home.do";
            } else {
                throw new MemberException("로그인에 실패하였습니다.");
            }
        } else {
            throw new MemberException("일치하는 회원정보가 없습니다.");
        }

    }


    //로그인
    @RequestMapping(value = "login.me", method = RequestMethod.POST)
    public String login(@ModelAttribute Member m, Model model) {
        Member loginUser = mService.login(m);

        if (loginUser != null) {
            if (bcrypt.matches(m.getUserPwd(), loginUser.getUserPwd())) {
                model.addAttribute("loginUser", loginUser);
                return "redirect:home.do";
            } else {
                throw new MemberException("로그인에 실패하였습니다.");
            }
        } else {
            throw new MemberException("일치하는 회원정보가 없습니다.");
        }
    }






    // 회원가입
    @RequestMapping("insertMember.me")
    public String insertMember(@ModelAttribute Member m, HttpServletRequest req) {
        System.out.println(m);

        if (m.getUserPwd() == null) {
            m.setUserPwd("1111");
            m.setUserName(m.getUserNickname());
        }
        
        //생일 전환
        String str = req.getParameter("userBirths");
 		str = str.replaceAll("[^0-9]", "");
 		if(str.length()==8) {
 			str = str.substring(2,8);
 		}
 		if(Integer.parseInt(str.substring(0,2))<24) {
 			str = "20"+str;
 			str = str.substring(0,4)+"-"+str.substring(4,6)+"-"+str.substring(6,8);
 		}else {
 			str = "19"+str;
 			str = str.substring(0,4)+"-"+str.substring(4,6)+"-"+str.substring(6,8);
 		}
 		
 		java.sql.Date d = java.sql.Date.valueOf(str);
 		
 		m.setUserBirth(d);
 		
 		int resultPoint = 0;
 		String getUserRecommend = m.getUserRecommend();
 	
        //추천인코드자동부여
        String generatedString = RandomStringUtils.randomAlphanumeric(6);
        //추천인이 동일한지여부하고 다시돌리기
        m.setUserRecommend(generatedString);

        //비밀번호암호화
        String encPwd = bcrypt.encode(m.getUserPwd());
        m.setUserPwd(encPwd);


        // 카테고리에따른 회원관리번호(1:일반, 2:전문, 3:관리자)
        String category = req.getParameter("category");

        if (category.equals("general")) {
            m.setUserCNumber(1);

        } else {
            m.setUserCNumber(2);
        }
        // 회원가입.
        int result = mService.insertMember(m);

        String userId = m.getUserId();
        int selectMember = mService.selectMember(userId);

        String userHealth = null;
        if (req.getParameter("userHealth") != null) {
            String[] arr = req.getParameterValues("userHealth");
            for (int i = 0; i < arr.length; i++) {
                if (i == 0) {
                    userHealth = arr[i];
                } else {
                    userHealth = userHealth + "," + arr[i];
                }
            }
        }else {
       	 userHealth = "없음";
        }

//      주소테이블에 기본 주소 추가 -----------------------------------------------------
        HashMap < String, Object > addressMap = new HashMap < String, Object > ();
        addressMap.put("userNum", selectMember);
        addressMap.put("addressZipcode", req.getParameter("userZipcode"));
        addressMap.put("addressBuilding", req.getParameter("userAddress"));
        addressMap.put("addressDetail", req.getParameter("userAddressDetail"));
        addressMap.put("addressPhone",	m.getUserPhone());
        addressMap.put("userName", m.getUserName());
        addressMap.put("addressAddressee", m.getUserName());
        addressMap.put("userHealth", userHealth);
        
        mService.insertBasicAddress(addressMap);
//      주소테이블에 기본 주소 추가 end-----------------------------------------------------

        HashMap < String, Object > map = new HashMap < String, Object > ();

        map.put("category", category);
        map.put("userNum", selectMember);
        map.put("userZipcode", req.getParameter("userZipcode"));
        map.put("userAddress", req.getParameter("userAddress"));
        map.put("userAddressDetail", req.getParameter("userAddressDetail"));
        map.put("userHealth", userHealth);

        int resultGenral = mService.insertMemberAddress(map); 
        //추천인코드입력하고 다른 추천포인트올려주기.(포인트단하면서하기)
 		
 		if(getUserRecommend!="") {
 			// 있는지없는지확인
 			resultPoint = mService.checkRecommend(getUserRecommend);
 	 		System.out.println(resultPoint);
 	 		//있으면
 			if(resultPoint >0) {
 				//다른사람 추천인포인트
 				Member otherRecommend= mService.searchRecommend(getUserRecommend);
 				
 				HashMap<String, Object> recommendMap = new HashMap < String, Object > ();
 				recommendMap.put("id", otherRecommend.getUserNum());
 				recommendMap.put("updateName","추천인코드");
 				recommendMap.put("updatePoint", "+1000");
 				//해당 usernum에 insert
 				mService.pointAdd(recommendMap);
 				//해당 유저 총점수 업데이트.
 				mService.totalPoint(otherRecommend.getUserNum());
 				
 				// 내 추천인 포인트
 				Member myRecommend= mService.searchMyUserNum(m.getUserId());
				
				HashMap<String, Object> MyPoint = new HashMap < String, Object > ();
				MyPoint.put("id", myRecommend.getUserNum());
				MyPoint.put("updateName","추천인코드");
				MyPoint.put("updatePoint", "+1000");
				//해당 usernum에 insert
				mService.pointAdd(MyPoint);
				//해당 유저 총점수 업데이트.
				mService.totalPoint(myRecommend.getUserNum());
 				
 				
 			}
 		}
        if (result > 0 && resultGenral > 0) {
            return "enrollSuccess";
        } else {
            return "enrollFail";
        }


    
    }

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
    
    //비밀번호 변경페이지
    @RequestMapping("searchPwdResult.me")
    public String searchPwdResult(HttpSession session, Model model, @RequestParam("userId") String userId) {
    		model.addAttribute("userId",userId);
        return "searchPwdResult";
    }
    
    //비밀번호 변경
    @RequestMapping(value="updatePwd.me", method = RequestMethod.POST)
	public String updatePwd(@RequestParam("myPwd") String newPwd, @RequestParam("userId") String userId) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("memberId", userId);
		map.put("encPwd", bcrypt.encode(newPwd));
		int result = mService.updatePwd(map);
		
		if(result > 0) {
			return "redirect:logout.me";
		} else {
			throw new MemberException("비밀번호 변경을 실패하였습니다.");
		}
	}
    
    //로그아웃
    @RequestMapping("logout.me")
    public String logout(HttpSession session, SessionStatus status, Model model) {
        System.out.println(123);
        String access_Token = (String) session.getAttribute("access_Token");

        if (access_Token != null && !"".equals(access_Token)) {
            session.removeAttribute("access_Token");
            session.invalidate();
            status.setComplete();
            return "redirect:home.do";

        } else {
            System.out.println("access_Token is null");
            status.setComplete();
            return "redirect:home.do";
        }
    }


    // 아이디 중복검사
    @RequestMapping("checkId.me")
    @ResponseBody
    public String checkId(@RequestParam("id") String id) {

        int count = mService.checkId(id);

        String result = count == 0 ? "yes" : "no";

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

    // 회원가입 시 이메일 중복 확인
    @RequestMapping("searchEmail.me")
    @ResponseBody
    public String searchEmail(@RequestParam("memberEmail") String memberEmail) {

        int count = mService.searchEmail(memberEmail);

        String result = count == 0 ? "yes" : "no";

        return result;
    }
    
    //아이디 찾기
    @RequestMapping(value="searchId.me", method=RequestMethod.POST)
	public ModelAndView searchId(@ModelAttribute Member m, ModelAndView mv) {
		
		Member mem = mService.searchId(m);
		
		mv.addObject("mem", mem);
		mv.setViewName("searchIdResult");
		
		return mv;
	}
    
    //아이디 이메일 확인
    @RequestMapping(value="emailIdChk.me")
    @ResponseBody
   	public String emailIdChk(@RequestParam("memberEmail") String email,@RequestParam("memberId") String userId ) {
   		
    	System.out.println(userId);
   		Member mem = mService.checkIdEmail(userId);
   		
   		String cheEmail = mem.getEmail();
   		
   		if(cheEmail.equals(email)) {
   			return "yes";
   		}else {
   			return "no";
   		}
   	}
    

    //  --------------------------------- 이메일 인증 --------------------------------------	

    @Autowired
    private JavaMailSenderImpl mailSender;
    private int authNumber;

    @RequestMapping("checkEmail.me")
    @ResponseBody
    public String checkEmail(@RequestParam("memberEmail") String email) {
        System.out.println("이메일인증 : " + email);

        return joinEmail(email);
    }

    public void makeRandomNumber() {
        Random r = new Random();
        int checkNum = r.nextInt(888888) + 111111;
        System.out.println("인증번호 : " + checkNum);
        authNumber = checkNum;
    }

    public String joinEmail(String email) {
        System.out.println("joinEmail들어옴");
        makeRandomNumber();
        String setFrom = "000zxzc123@gmail.com";
        String toMail = email;
        String title = "YoungHae 인증 이메일입니다.";
        String content = "홈페이지를 방문해주셔서 감사합니다.<br><br> 인증번호는 " + authNumber + " 입니다.<br> 해당 인증번호를 인증번호 확인란에 기입하여주세요";

        mailSend(setFrom, toMail, title, content);
        return Integer.toString(authNumber);
    }

    public void mailSend(String setFrom, String toMail, String title, String content) {
        MimeMessage message = mailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    //		--------------------------------- 이메일 인증 ---------------------------------------
 // 내 정보 수정
 	@RequestMapping("myInfoEdit.me")
 	public String updateMember(@ModelAttribute Member m, HttpSession session, Model model,
 			HttpServletRequest req, @RequestParam("myPwd") String newPwd) {
 							
 		int result = 0;
 		int resultGenral = 0;
 		Member mem = (Member)session.getAttribute("loginUser");
 		
 		//생일 date형식으로 변경
 		String str = req.getParameter("birth");
 		str = str.replaceAll("[^0-9]", "");
 		if(str.length()==8) {
 			str = str.substring(2,8);
 		}
 		if(Integer.parseInt(str.substring(0,2))<24) {
 			str = "20"+str;
 			str = str.substring(0,4)+"-"+str.substring(4,6)+"-"+str.substring(6,8);
 		}else {
 			str = "19"+str;
 			str = str.substring(0,4)+"-"+str.substring(4,6)+"-"+str.substring(6,8);
 		}
 		
 		java.sql.Date d = java.sql.Date.valueOf(str);
 		
 		m.setUserBirth(d);
 		
 		//비밀번호 변경
 		if(newPwd !="") {
 			HashMap<String, String> map = new HashMap<String,String>();
 			map.put("memberId", mem.getUserId());
 			map.put("encPwd", bcrypt.encode(newPwd));
 			
 			mService.updatePwd(map);
 		}
 		
 		
 		// member 업데이트
 		result = mService.updateMember(m);
 		
 		// 일반회원/전문가 정보업데이트
 			String userHealth = null;
 	         if (req.getParameter("userHealth") != null) {
 	             String[] arr = req.getParameterValues("userHealth");
 	             for (int i = 0; i < arr.length; i++) {
 	                 if (i == 0) {
 	                     userHealth = arr[i];
 	                 } else {
 	                     userHealth = userHealth + "," + arr[i];
 	                 }
 	             }
 	         }else {
 	        	 userHealth = "없음";
 	         }
 	         
 	 		
 	 		System.out.println(mem.getUserNum());
 	        HashMap < String, Object > map = new HashMap < String, Object > ();
 	        String category = req.getParameter("category");
 	        map.put("category", category);
 	        map.put("userNum", mem.getUserNum());
 	        map.put("userZipcode", req.getParameter("userZipcode"));
 	        map.put("userAddress", req.getParameter("userAddress"));
 	        map.put("userAddressDetail", req.getParameter("userAddressDetail"));
 	        map.put("userHealth", userHealth);
 	        
 	        resultGenral = 0;
 	        if(StringUtils.isNumeric(m.getUserId())) {
 	        	resultGenral = mService.insertMemberAddress(map);
 	        }else {
 	        	resultGenral = mService.updateMemberAddress(map);
 	        }
 		if(result > 0 && resultGenral>0) {
 			model.addAttribute("loginUser", mService.login(m));
 			return "../myPage/myPage";
 		}	
 		else{ 
 			throw new MemberException("회원 수정을 실패하였습니다.");
 		}
 		
 	}
}