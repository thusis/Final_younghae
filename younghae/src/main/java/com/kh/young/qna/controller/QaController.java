package com.kh.young.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.young.model.vo.Member;
import com.kh.young.qna.common.Qexception;
import com.kh.young.qna.dto.AnswerRespDto;
import com.kh.young.qna.dto.ExpertRespDto;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;
import com.kh.young.qna.dto.SupplementRespDto;
import com.kh.young.qna.service.QaService;

@Controller
public class QaController {
	
	@Autowired
	private QaService qService;
	
	/**간이 로그인&로그아웃**/
	@GetMapping("login.qa")
	public String loginHome(@RequestParam("userNum") Integer userNum, HttpServletRequest request) {
		qService.setLoginUser(userNum, request);
		return "redirect:home.qa";
	}
	
	@RequestMapping("logout.qa")
	public String logoutHome(HttpServletRequest request) {
		ServletContext application = request.getSession().getServletContext();
	    application.setAttribute("loginUser",null);
	    return "redirect:home.qa";
	}
	
	/******************************************************************/
	/**홈 화면**/
	@GetMapping("home.qa")
	public String goHome(HttpServletRequest request, Model model) {
		
		if(((Member)request.getSession().getServletContext().getAttribute("loginUser")) != null) {
			ArrayList<QuestionRespDto> myQuest = getMyQna(request);
			System.out.println(myQuest);
			model.addAttribute("myQuest", myQuest);
			model.addAttribute("isRead",getIsRead(myQuest));
		}
		
		model.addAttribute("qlist", getQuestionList(1, 1));
		model.addAttribute("topTwo", getTopTwo());

		return "qnahome";
	}

	/**내 질문목록**/
	private ArrayList<QuestionRespDto> getMyQna(HttpServletRequest request) {
		return qService.getMyQna(request);
	}

	/**내 질문목록 - 새로운답글 읽음여부**/
	private boolean getIsRead(ArrayList<QuestionRespDto> myQuest) {
	 	for(QuestionRespDto q : myQuest ) {
	 		if(q.getQuestion().getIsRead().equals("N")) {return false;}
	 	}
	 	return true;
	}
	
	/**페이지네이션 - listCount 구하기**/
	public int getListCount() {
		return qService.getListCount();
	}
	
	/**페이지 넘버 입력받아 리스트 조회**/
	private ArrayList<QuestionRespDto> getQuestionList(Integer page, int listCount){
		return qService.getQuestionList(page, listCount);
	}
	
	/**조회수 기준 상위 두 개 게시글 반환**/
	private ArrayList<QuestionRespDto> getTopTwo(){
		return qService.getTopTwo();
	}
	
	/******************************************************************/
	/**게시글 목록 조회**/
	@GetMapping("boardList.qa")
	public String selectList(@RequestParam(value="page", required=false) Integer page, Model model) {
		int listCount = getListCount();
		ArrayList<QuestionRespDto> questionList = getQuestionList(page, listCount);
		model.addAttribute("qlist", questionList);

		return "recentList";
	}

	/******************************************************************/
	/**게시글 삽입 페이지 조회**/
	@GetMapping("writequestion.qa")
	public String writeQuestion() {
		return "writequestion";
	}
	
	/**게시글 삽입 - supplement검색**/
	@RequestMapping(value = "searchSupplement.qa")
	@ResponseBody
	public void searchSupplement(@RequestParam("keyword") String keyword, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<SupplementRespDto> sresp = qService.searchSupplement(keyword);
		
		System.out.println(sresp);
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();

		try {
			gson.toJson(sresp, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	/**게시글 삽입**/
	@PostMapping("insertquestion.qa")
	public String insertQuestion(@ModelAttribute QuestionInsertDto quest, HttpServletRequest request) {
		int result = qService.insertQuestion(quest, request);
		if(result>0) {
			return "redirect:home.qa";
		} else {
			throw new Qexception("질문 작성 실패");
		}
	}
	
	/******************************************************************/
	/**게시글 조회**/
	@GetMapping("question.qa")
	public String selectQuestion(@RequestParam("boardNum") int boardNum, @RequestParam(value="page", required=false) Integer page, HttpServletRequest request, Model model) {
		model.addAttribute("qresp", qService.selectQuestion(boardNum, request));
		return "selectquestion";
	}

	/*******************************************************************/
	/**답변 작성**/
	@GetMapping("writeanswer.qa")
	public String writeAnswer(@RequestParam("boardNum") int questionNum, HttpServletRequest request, Model model){
		model.addAttribute("qresp", qService.selectQuestion(questionNum, request));
		model.addAttribute("alert", qService.getAlreadyAnswered(questionNum, request)); //이미 작성시 true 반환 -> alert
		return "writeanswer";
	}
	
	@PostMapping("insertanswer.qa")
	public String insertAnswer(@ModelAttribute QuestionInsertDto quest, HttpServletRequest request, Model model) {
		int result = qService.insertAnswer(quest, request); // quest의 boardTitle로 questionNum 받아올거야
		if(result>0) {
			model.addAttribute("boardNum", quest.getBoardTitle());
			return "redirect:question.qa";
		} else {
			throw new Qexception("답변 작성 실패");
		}
	}
	
	/*******************************************************************/
	
	/**게시글 검색**/
	@GetMapping("search.qa")
	public String seachQuestion() {
		return "searchresult";
	}
	
	/*******************************************************************/
	/**전문가찾기**/
	@GetMapping("expertfind.qa")
	public String findExpertList() {

		return "expertFind";
	}
	
	/*******************************************************************/
	@GetMapping("expertprofile.qa")
	public String selectExpert(@RequestParam("expertNum") int expertNum, Model model, HttpServletRequest request) {
		ExpertRespDto eresp = qService.selectExpertResp(expertNum);
		model.addAttribute("eresp",eresp);
		if(eresp.getAnswerListSize()!=0) {
			ArrayList<QuestionRespDto> qlist = qService.selectExpertQuestionList(expertNum);
			model.addAttribute("qlist",qlist);
		}
		return "expertProfile";
	}
	
	/*****************************************************************/
	@GetMapping("experthospital.qa")
	public String selectHospital(@RequestParam("expertNum") int expertNum, Model model, HttpServletRequest request) {
		model.addAttribute("expert", qService.selectExpertResp(expertNum).getExpert());
		return "expertHospital";
	}
	
	
	/**채팅방**/
	@GetMapping("open.ch")
	public String openChat() {
		return "chat";
	}

}
