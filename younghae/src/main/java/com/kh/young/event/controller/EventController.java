package com.kh.young.event.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.young.event.exception.eventException;
import com.kh.young.event.service.EventService;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.Point;

@SessionAttributes("loginUser")
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
	public String attendanceEventView() {
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
	//출석체크하기 버튼 insert
	@RequestMapping("insertAttendance.ev")
	public String insertAttendance(HttpSession session
//														ServletContext application
			) {
	
//		int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
//		int userNum = ((Member)application.getAttribute("loginUser")).getUserNum();
//		Member m = (Member)session.getAttribute("loginUser");
//		System.out.println("m : " + m);
//		int userNum = m.getUserNum();
		
		int userNum = 27;
		int result = eService.insertAttendance(userNum);
		
		if(result > 0) {
			return "redirect:attendanceEvent.ev";
		} else {
			throw new eventException("출석체크 실패");
		}
		
	}
	
	@RequestMapping("attendanceEventAward.ev")
	public String eventAward(HttpSession session, @ModelAttribute Point p) {
//		int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
		Member m = (Member)session.getAttribute("loginUser");
		int userNum = m.getUserNum();
		
		//출석 수 카운트
		int atCount = eService.selectCountAttendance(userNum); 
	
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
		  p.setUserNum(userNum);
		  HashMap<String, Object> pointTable = new HashMap<>();
		  pointTable.put("point", point);
		  pointTable.put("userNum", userNum);
		  pointTable.put("content", "출석이벤트");
		  pointTable.put("point_amount", point_amount);
		  
		  int attendanceAward = eService.attendanceAward(pointTable);
		  int updatePoint = eService.updatePoint(pointTable);
		
		return "eventAttendance";
	}
	
	/** 생일 이벤트 
	 * @throws Exception **/
	@RequestMapping("birthdayEvent.ev")
	public String checkBirth(HttpSession session, Model model) throws Exception {
//		int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();	
//		Member m = (Member)session.getAttribute("loginUser");
//		int userNum = m.getUserNum();
		int userNum = 27;
		
		int checkBirth = eService.checkBirth(userNum);
	
		LocalDate month = LocalDate.now();
		int nowMonth =  month.getMonthValue();
		System.out.println("nowMonth : " + nowMonth);
		System.out.println("checkBirth : " + checkBirth);
		String coupon = LocalDate.now().toString();
		int disCount = 20;
		String disCountContent = "생일 이벤트 쿠폰";
		
		String couponTimeLimit = AddDate(coupon, 0, 1, 0);
		 HashMap<String, Object> map = new HashMap<>();
		
		if(checkBirth == nowMonth) {
			map.put("userNum", userNum);
			map.put("couponTimeLimit", couponTimeLimit);
			map.put("disCount", disCount);
			map.put("disCountContent", disCountContent);
			int result = eService.insertCoupon(map);
			
			if(result == 1) {
				model.addAttribute("result", 1);
				return "eventBirthday";
			} else {
				throw new eventException("쿠폰 발급 실패");
			}
		} else {
			throw new eventException("생일자가 아닙니다");
		}
		
	}
private static String AddDate(String strDate, int year, int month, int day) throws Exception {
		
        SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
        
		Calendar cal = Calendar.getInstance();
        
		Date dt = (Date) dtFormat.parse(strDate);
        
		cal.setTime(dt);
        
		cal.add(Calendar.YEAR,  year);
		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DATE,  day);
        
		return dtFormat.format(cal.getTime());
	}
}
