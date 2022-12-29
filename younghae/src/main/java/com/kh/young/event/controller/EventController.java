package com.kh.young.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.kh.young.event.exception.eventException;
import com.kh.young.event.service.EventService;

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
	public String insertAttendance(/**HttpSession session*/
//														ServletContext application
			) {
	
//		int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
//		int userNum = ((Member)application.getAttribute("loginUser")).getUserNum();
		int userNum = 2;
		int result = eService.insertAttendance(userNum);
		
		if(result > 0) {
			return "redirect:attendanceEvent.ev";
		} else {
			throw new eventException("출석체크 실패");
		}
		
	}
	
	@RequestMapping("attendanceEventAward.ev'")
	public String eventAward(/**HttpSession session*/) {
		//출석 수 카운트
//		int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();
		int userNum = 2;
		
		int atCount = eService.selectCountAttendance(userNum);
		//출석일 별 보상 (jsp로 코드 넘기기)
		if(atCount >= 5 && atCount < 15) {
			
		} else if(atCount >= 15 && atCount < 30) {
			
		} else if(atCount == 30) {
			
		}
		return null;
	}
	
	/** 생일 이벤트 **/
	@RequestMapping("birthdayEvent.ev")
	public String checkBirth(/**HttpSession session*/) {
//		int userNum = ((Member)session.getAttribute("loginUser")).getUserNum();	
		int userNum = 2;
		
		int checkBirth = eService.checkBirth(userNum);
		
		return null;
	}
	
}
