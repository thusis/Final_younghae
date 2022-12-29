package com.kh.young.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.young.event.service.EventService;

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
	
	//출석체크하기 버튼 insert
	@RequestMapping("insertAttendance.ev'")
	public String insertAttendance() {
		
		return "redirect:eventAttendance";
	}
}
