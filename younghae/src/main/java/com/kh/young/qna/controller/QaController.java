package com.kh.young.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.young.qna.service.QaService;

@Controller
public class QaController {
	
	@Autowired
	private QaService qService;
	
	@GetMapping("test.qa")
	public String test() {
		return "searchresult";
	}
	@GetMapping("test1.qa")
	public String test1() {
		return "expertFind";
	}
	@GetMapping("test2.qa")
	public String test2() {
		return "expertHospital";
	}
	@GetMapping("test3.qa")
	public String test3() {
		return "expertProfile";
	}
	@GetMapping("test4.qa")
	public String test4() {
		return "qnadetail";
	}
	@GetMapping("test5.qa")
	public String test5() {
		return "writequestion";
	}

}
