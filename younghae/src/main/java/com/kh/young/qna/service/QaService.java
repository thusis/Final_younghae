package com.kh.young.qna.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.kh.young.qna.dto.AnswerRespDto;
import com.kh.young.qna.dto.ExpertRespDto;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;
import com.kh.young.qna.dto.SupplementRespDto;

@Service
public interface QaService {

	void setLoginUser(Integer userNum, HttpServletRequest request);
	
	int getListCount();

	ArrayList<QuestionRespDto> getMyQna(HttpServletRequest request);
	ArrayList<QuestionRespDto> getQuestionList(Integer page, int listCount);
	ArrayList<QuestionRespDto> getTopTwo();

	ArrayList<SupplementRespDto> searchSupplement(String keyword);

	int insertQuestion(QuestionInsertDto quest, HttpServletRequest request);

	QuestionRespDto selectQuestion(int boardNum, HttpServletRequest request);

	boolean getAlreadyAnswered(int questionNum, HttpServletRequest request);

	int insertAnswer(QuestionInsertDto quest, HttpServletRequest request);

	ExpertRespDto selectExpertResp(int userNum);

	ArrayList<QuestionRespDto> selectExpertQuestionList(int expertNum);


}
