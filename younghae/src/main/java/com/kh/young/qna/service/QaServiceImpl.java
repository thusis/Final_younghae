package com.kh.young.qna.service;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Supplement;
import com.kh.young.qna.dao.QaDao;
import com.kh.young.qna.dto.AnswerRespDto;
import com.kh.young.qna.dto.ExpertRespDto;
import com.kh.young.qna.dto.MyQuestDto;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;
import com.kh.young.qna.dto.SupplementRespDto;

@Service("QaService")
public class QaServiceImpl implements QaService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private QaDao qdao;

	/**간이로그인**/
	@Override
	public void setLoginUser(Integer userNum, HttpServletRequest request) {
		Member loginMember = qdao.setLoginUser(sqlSession,userNum);
		ServletContext application = request.getSession().getServletContext();
		application.setAttribute("loginUser", loginMember);
	}
	
	/**내 질문목록**/
	@Override
	public ArrayList<QuestionRespDto> getMyQna(HttpServletRequest request) { 
		
		int userNum = ((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum();
		ArrayList<QuestionRespDto> myQuestions = qdao.getMyQuestions(sqlSession,userNum);
	
		System.out.println("test"+myQuestions);

		return myQuestions;
	}

	@Override
	public int getListCount() {
		return qdao.getListCount(sqlSession);
	}

	@Override
	public ArrayList<QuestionRespDto> getQuestionList(Integer page, int listCount) {
		int currentPage = 1;
		if(page!=null) {
			currentPage=page;
		}
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<QuestionRespDto> questionList = qdao.selectQuestionList(sqlSession, pi);
		
		for(QuestionRespDto q : questionList) {
			q.setWriterInfo(
					writerInfoToString(getWriterInfoMap(q.getBoard().getUserNum()))
					);
		}
		return questionList;
	}
	
	private Map getWriterInfoMap(int userNum) {
		return qdao.getWriterInfoMap(sqlSession, userNum);
	}
	
	/**글쓴이 정보 세팅 ex) 20대 / 남 **/
	private String writerInfoToString(Map paramap) {
		
		String info = "";
		
		Date thisyear = new Date(System.currentTimeMillis());
		SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
		
		int currentYear = Integer.parseInt(yyyy.format(thisyear));
		
		int birthYear = Integer.parseInt(paramap.get("USER_BIRTH").toString().split("-")[0]);
		int age = currentYear - birthYear + 1;
		info = (age/10) + "0 대";
		
		String gender = ((String) paramap.get("USER_GENDER")).trim().toString();
		
		if(gender.equals("F")) { info += " / 남"; }
		else if(gender.equals("M")) { info += " / 여"; }
		
		return info;
	}

	@Override
	public ArrayList<QuestionRespDto> getTopTwo() {
		ArrayList<QuestionRespDto> topTwo = qdao.getTopTwo(sqlSession);
		
		for(QuestionRespDto q : topTwo) {
			q.setWriterInfo(
					writerInfoToString(getWriterInfoMap(q.getBoard().getUserNum()))
					);
		}
		return topTwo;
	}

	@Override
	public ArrayList<SupplementRespDto> searchSupplement(String keyword) {
		return qdao.searchSupplement(sqlSession, keyword);
	}
	
	@Override
	public int insertQuestion(QuestionInsertDto quest, HttpServletRequest request) {
		quest.setUserNum(((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum());
		
		MultipartFile attachment = quest.getAttachment();
		getAttachParam(attachment, request);
		quest.setAttachParam(getAttachParam(attachment, request));
		
		return qdao.insertQuestion(sqlSession, quest);
	}

	private Attachment getAttachParam(MultipartFile attachment, HttpServletRequest request) {
		
		Attachment attachParam = new Attachment();
		attachParam.setAttachName(attachment.getOriginalFilename());
		if(attachment != null && !attachment.isEmpty()) {
			String[] returnArr = saveFile(attachment, request);// returnArr[0] = savePath; returnArr[1] = rename;
			if(returnArr[1] != null) {
				attachParam.setAttachPath(returnArr[0]);
				attachParam.setAttachRename(returnArr[1]);
			}
		}
		return attachParam;
	}
	
	private String[] saveFile(MultipartFile attachment, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String rawname = attachment.getOriginalFilename();
		String rename = sdf.format(new Date(System.currentTimeMillis())) + ranNum + rawname.substring(rawname.lastIndexOf("."));
		String fileRoute = folder + "\\" + rename;
		
		try {
			attachment.transferTo(new File(fileRoute));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = rename;
		
		return returnArr;
	}

	@Override
	public QuestionRespDto selectQuestion(int boardNum, HttpServletRequest request) {
		
		QuestionRespDto qresp = qdao.selectQuestion(sqlSession, boardNum);
		qresp.setWriterInfo(
				writerInfoToString(getWriterInfoMap(qresp.getBoard().getUserNum()))
		);
		
		if((Member)request.getSession().getServletContext().getAttribute("loginUser") != null) {
			int userNum = ((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum();
			
			if(qresp.getBoard().getUserNum() != userNum) {
				qdao.addViewCount(sqlSession, boardNum);
			} else {
				qdao.updateIsRead(sqlSession, boardNum);
			}
		}
		return qresp;
	}

	@Override
	public boolean getAlreadyAnswered(int questionNum, HttpServletRequest request) {
		
		int userNum = ((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum();
		
		QuestionRespDto qresp = qdao.selectQuestion(sqlSession, questionNum);
		for( AnswerRespDto answer : qresp.getAnswerList()) {
			if(userNum == answer.getBoard().getUserNum()) {
				return true;
			}
		}
		return false;
	}

	@Override
	public int insertAnswer(QuestionInsertDto quest, HttpServletRequest request) {
		quest.setUserNum(((Member)request.getSession().getServletContext().getAttribute("loginUser")).getUserNum());
		
		MultipartFile attachment = quest.getAttachment();
		getAttachParam(attachment, request);
		quest.setAttachParam(getAttachParam(attachment, request));
		
		return qdao.insertAnswer(sqlSession, quest);
	}

	




}
