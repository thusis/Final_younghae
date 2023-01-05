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
import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Clip;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Reply;
import com.kh.young.qna.common.Qexception;
import com.kh.young.qna.dto.ExpertRespDto;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;
import com.kh.young.qna.dto.ReplyRespDto;
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
		
//		if(((Member)request.getSession().getServletContext().getAttribute("loginUser")) != null) {
		if(((Member)request.getSession().getAttribute("loginUser")) != null) {
			ArrayList<QuestionRespDto> myQuest = getMyQna(request);
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
	/**내가 남긴 질문 - 더보기**/
	@GetMapping("myquest.qa")
	public String goMyQuest(HttpServletRequest request, Model model) {
		model.addAttribute("myQuest",getMyQna(request));
		return "myquestlist";
		
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
	/**댓글 입력**/
	@PostMapping("insertreply.qa")
	public void insertReply(@ModelAttribute Reply r, HttpServletResponse response) {
		System.out.println("컨트롤러INSERT"+r);
		int result = qService.insertReply(r);
		System.out.println("컨트롤러"+result);
		
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<ReplyRespDto> replyList = getReplyList(r.getBoardNum());
		
		System.out.println("컨트롤러SELECTLIST"+replyList);
		
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy-MM-dd"); // 형식 지정 후
		Gson gson = gb2.create();

		try {
			gson.toJson(replyList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	private ArrayList<ReplyRespDto> getReplyList(int boardNum) {
		return qService.getReplyList(boardNum);
	}

	/**댓글 삭제**/
	@GetMapping("deletereply.qa")
	@ResponseBody
	public int deleteReply(@RequestParam("replyNum") int replyNum, HttpServletResponse response) {
		return qService.deleteReply(replyNum);
	}
	
	/*******************************************************************/
	/**스크랩**/
	@GetMapping(value = "setScrap.qa")
	@ResponseBody
	public String setScrap(@ModelAttribute Clip clip, HttpServletResponse response) {
		qService.setScrap(clip);
		return String.valueOf(qService.getScrapCount(clip.getBoardNum()));
	}
	
	@GetMapping(value = "deleteScrap.qa")
	@ResponseBody
	public String deleteScrap(@ModelAttribute Clip clip, HttpServletResponse response) {
		qService.deleteScrap(clip);
		return String.valueOf(qService.getScrapCount(clip.getBoardNum()));
	}
	
	/*******************************************************************/
	/**게시글 수정**/
	@PostMapping("updatequestion.qa")
	public String updateQuestion(@ModelAttribute QuestionInsertDto quest, HttpServletRequest request, Model model) {
		int result = qService.updateQuestion(quest, request); // quest의 boardTitle로 questionNum 받아올거야
		if(result>0) {
			return "redirect:question.qa";
		} else {
			throw new Qexception("답변 작성 실패");
		}
	}
	/*******************************************************************/
	/**게시글 삭제**/
	@GetMapping("updateIsSolved.qa")
	public String updateIsSolved(@RequestParam int boardNum) {
		int result = qService.updateIsSolved(boardNum); // quest의 boardTitle로 questionNum 받아올거야
		if(result>0) {
			return "redirect:question.qa?boardNum="+boardNum;
		} else {
			throw new Qexception("질문글 작성 실패");
		}
	}
	/*******************************************************************/
	/**게시글 삭제**/
	@GetMapping("deletequestion.qa")
	public String deleteQuestion(@RequestParam int boardNum) {
		int result = qService.deleteQuestion(boardNum); // quest의 boardTitle로 questionNum 받아올거야
		if(result>0) {
			return "redirect:home.qa";
		} else {
			throw new Qexception("질문글 작성 실패");
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
	public String findExpertList( @RequestParam(value="page", required=false) Integer page, Model model) {
		int listCount = qService.getExpertsListCount();

		model.addAttribute("pi", getPageInfo(page, listCount, 10));
		model.addAttribute("erespList", qService.selectExpertList(page, listCount));
		
		return "expertFind";
	}


	private PageInfo getPageInfo(Integer page, int listCount, int i) {
		int currentPage = 1;
		if(page!=null) {
			currentPage=page;
		}
		return Pagination.getPageInfo(currentPage, listCount, i);
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

    @GetMapping("goToChatPayment.qa")
    public String goToChatPayment(HttpServletRequest request, @RequestParam String info, Model model) {
//    	http://localhost:8888/young/goToChatPayment.ch?info=26_21_150
    	if(((Member)request.getSession().getAttribute("loginUser")).getUserNum() != Integer.parseInt(info.split("_")[2])) {
    		throw new Qexception("잘못된 접근입니다");
    	}else {
    		model.addAttribute("chatResp",qService.getChatPaymentResp(info));
    	}
    	return "chatPayment";
    }
}
