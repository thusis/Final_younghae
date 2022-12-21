package com.kh.young.qna.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.kh.young.model.vo.Supplement;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;

@Service
public interface QaService {

	void setLoginUser(Integer userNum, HttpServletRequest request);

	int getListCount();

	ArrayList<QuestionRespDto> selectQuestionList(Integer page, int listCount);

	Object getMyQna(HttpServletRequest request);

	ArrayList<QuestionRespDto> getTopTwo();

	int insertQuestion(QuestionInsertDto quest, HttpServletRequest request);

	ArrayList<Supplement> searchSupplement(String keyword);

}
