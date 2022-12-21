package com.kh.young.qna.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.young.model.vo.Supplement;
import com.kh.young.qna.common.Qexception;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;
import com.kh.young.qna.service.QaService;

@Controller
public class QaController {
	
	@Autowired
	private QaService qService;
	
	@GetMapping("home.qa")
	public String goHome(HttpServletRequest request, Model model) {
//		model.addAttribute("myqna", getMyQna(request));
//		model.addAttribute("recentList", getQuestionList(1, 1));
//		model.addAttribute("topTwo", getTopTwo());
		return "qnahome";
	}

	private Object getMyQna(HttpServletRequest request) {
		return qService.getMyQna(request);
	}
	
	private ArrayList<QuestionRespDto> getQuestionList(Integer page, int listCount) {
		return qService.selectQuestionList(page, listCount);
	}

	private ArrayList<QuestionRespDto> getTopTwo() {
		return qService.getTopTwo();
	}

	@GetMapping("login.qa")
	public String loginHome(@RequestParam("userNum") Integer userNum, HttpServletRequest request) {
		qService.setLoginUser(userNum, request);
		return "redirect:home.qa";
	}
	
	@GetMapping("boardList.qa")
	public String selectList(@RequestParam(value="page", required=false) Integer page, Model model) {
		int listCount = qService.getListCount();
		ArrayList<QuestionRespDto> list = getQuestionList(page, listCount);
		return "recentList";
	}
	
	/**게시글 삽입**/
	@GetMapping("writequestion.qa")
	public String writeQuestion() {
		return "writequestion";
	}
	
	@PostMapping("searchSupplement.qa")
	public String searchSupplement(@RequestParam("keyword") String keyword, Model model) {
		model.addAttribute("keyword", keyword);
		model.addAttribute("list",qService.searchSupplement(keyword));
		return "supplementPopup";
	}
	
	@PostMapping("insertquestion.qa")
	public String insertQuestion(@ModelAttribute QuestionInsertDto quest,HttpServletRequest request) {
		int result = qService.insertQuestion(quest, request);
		if(result>0) {
			return "selectquestion";
		} else {
			throw new Qexception("질문 작성 실패");
		}
	}
	
	/**게시글 조회**/
	@GetMapping("question.qa")
	public String selectQuestion() {
		return "selectquestion";
	}
	@GetMapping("search.qa")
	public String seachQuestion() {
		return "searchresult";
	}
	
	
	
	
	/**전문가찾기**/
	@GetMapping("expertfind.qa")
	public String findExpertList() {
		return "expertFind";
	}
	@GetMapping("expertprofile.qa")
	public String selectExpert() {
		return "expertProfile";
	}
	@GetMapping("experthospital.qa")
	public String selectHospital() {
		return "expertHospital";
	}
	
	
	
	/**채팅방**/
	@GetMapping("open.ch")
	public String openChat() {
		return "chat";
	}

}
