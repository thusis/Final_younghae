package com.kh.young.qna.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.kh.young.model.vo.Supplement;
import com.kh.young.qna.dto.AnswerRespDto;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;

@Service
public interface QaService {

	void setLoginUser(Integer userNum, HttpServletRequest request);

	int getListCount();

	HashMap<String, ArrayList> selectQuestionList(Integer page, int listCount);

	Object getMyQna(HttpServletRequest request);

	int insertQuestion(QuestionInsertDto quest, HttpServletRequest request);

	ArrayList<Supplement> searchSupplement(String keyword);

	HashMap<String, ArrayList> getTopTwo();

	QuestionRespDto getQresp(int boardNum, HttpServletRequest request);

	ArrayList<AnswerRespDto> getAnsRespList(int boardNum);

}
