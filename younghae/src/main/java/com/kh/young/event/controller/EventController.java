package com.kh.young.event.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.young.event.exception.eventException;
import com.kh.young.event.service.EventService;
import com.kh.young.model.vo.Member;

@SessionAttributes({"loginUser", "access_Token"})
@Controller	
public class EventController {
	
	@Autowired
	private EventService eService;
	
	//이벤트 메인
	@RequestMapping("event.ev")
	public String eventMain() {
		return "event";
	}
	//리뷰 이벤트 뷰
	@RequestMapping("reviewEvent.ev")
	public String reviewEventView() {
		return "eventReview";
	}
	//출석 이벤트 뷰
	@RequestMapping("attendanceEvent.ev")
	public String attendanceEventView(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNum = loginUser.getUserNum();
		
	//출석 수 카운트
	int atCount = eService.selectCountAttendance(userNum); 
	System.out.println("출석 수 카운트 : " + atCount);
	
	model.addAttribute("atCount", atCount);
	return "eventAttendance";
	}
	//생일 이벤트 뷰
	@RequestMapping("birthEvent.ev")
	public String birthEventView() {
		return "eventBirthday";
	}
	//댓글 이벤트 뷰
	@RequestMapping("replyEvent.ev")
	public String replyEventView() {
		return "eventReply";
	}
	
	/** 출석 이벤트 **/
	@RequestMapping("insertAttendance.ev")
	@ResponseBody
	public String insertAttendance(HttpSession session, HttpServletResponse response) {
	
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNum = loginUser.getUserNum();
		
		System.out.println("userNum : " + userNum);
		
		//당일 출석체크 여부
		int attendanceCheck = eService.attendanceCheck(userNum);
		
//		HashMap<String, Object> map = new HashMap<>();
//		map.put("userNum", userNum);
//		int checkEvent = eService.checkEvent(userNum);
		
		System.out.println(attendanceCheck);
		
		if(attendanceCheck > 0) {
//			throw new eventException("이미 출석체크를 하셨습니다.");
			return String.valueOf("1");
		} else {
			int result = eService.insertAttendance(userNum);	
		
			if(result > 0) {
//				return "redirect:attendanceEvent.ev";
				return String.valueOf("2");
			} else {
				return String.valueOf("3");
//				throw new eventException("출석체크 실패");
			}
		}
//		return null;		
	}
	
	@RequestMapping("attendanceEventAward.ev")
	@ResponseBody
	public String eventAward(HttpSession session, HttpServletResponse response, Model model) {
//		int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();

		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNum = loginUser.getUserNum();
		
		//출석 수 카운트
		int atCount = eService.selectCountAttendance(userNum); 
		System.out.println("출석 카운트 : " + atCount);
		int point = 0;
		String point_amount = null;
		  if(atCount >= 5 && atCount < 15) { // 500포인트 추가
			  point = 500;
			  point_amount = "+500";
		  } else if(atCount >= 15 && atCount < 30) { //2000포인트 추가
			  point = 2000;
			  point_amount = "+2000";
		  } else if(atCount == 30) { //5000포인트 추가
			  point = 5000;
			  point_amount = "+5000";
		  } 
		  
		  HashMap<String, Object> pointTable = new HashMap<>();
		  pointTable.put("point", point);
		  pointTable.put("userNum", userNum);
		  pointTable.put("content", "1월 출석이벤트");
		  pointTable.put("point_amount", point_amount);
		  
		  //포인트 테이블 내역 추가, 회원 포인트 업데이트
		  int attendanceAward = eService.attendanceAward(pointTable);
		  int updatePoint = eService.updatePoint(pointTable);
		  
		  //포인트 지급내역이 있는지 없는지 확인
		  int attAwardCheck = eService.attAwardCheck(userNum);
		  
		  if(attAwardCheck == 0) {
			  
			  if(attendanceAward > 0 && updatePoint > 0) {
				  return String.valueOf("1");  
			  } else {
				  return String.valueOf("0");
			  }
		  } else {
			  return String.valueOf("2");
		  }
		  
		  
	}
	
	/** 생일 이벤트 
	 * @throws Exception **/
	@RequestMapping("birthdayEvent.ev")
	@ResponseBody
	public String checkBirth(HttpSession session, Model model, HttpServletResponse response) throws Exception {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNum = loginUser.getUserNum();
		
		int checkBirth = eService.checkBirth(userNum);
		System.out.println("checkBirth : " + checkBirth);
		LocalDate month = LocalDate.now();
		int nowMonth =  month.getMonthValue();
		System.out.println("nowMonth : " + nowMonth);
		System.out.println("checkBirth : " + checkBirth);
		String coupon = LocalDate.now().toString();
		int disCount = 7;
		String disCountContent = "HappyBirthday! 생일 기념 쿠폰!(7% 할인 쿠폰)";
		String couponRegister = "xcvawersdfs";
		
		String couponTimeLimit = AddDate(coupon, 0, 1, 0);
		 HashMap<String, Object> map = new HashMap<>();
		
		 //쿠폰 지급내역이 있는지 없는지 확인
		int couponCheck = eService.birthCheck(userNum);
		if(couponCheck == 0) {
			if(checkBirth == nowMonth) {
				map.put("userNum", userNum);
				map.put("couponTimeLimit", couponTimeLimit);
				map.put("disCount", disCount);
				map.put("disCountContent", disCountContent);
				map.put("couponRegister", couponRegister);
				int result = eService.insertCoupon(map);
				
				if(result == 1) {
					return String.valueOf("1");
				} else {
					return String.valueOf("2");
				}
			} else {
					return String.valueOf("3");
			}
		} else {
					return String.valueOf("4");
		}
	}
//현재 날짜 뽑아오기	
private static String AddDate(String strDate, int year, int month, int day) throws Exception {
		
        SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
        
		Calendar cal = Calendar.getInstance();
        
		Date dt = (Date) dtFormat.parse(strDate);
        
		cal.setTime(dt);
        
		cal.add(Calendar.YEAR,  year);
		cal.add(Calendar.MONTH, month+2);
		cal.add(Calendar.DATE,  day);
        
		return dtFormat.format(cal.getTime());
	}
}
