package com.kh.young.qna.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.kh.young.chat.dto.ChatPaymentRespDto;
import com.kh.young.model.vo.Clip;
import com.kh.young.model.vo.Reply;
import com.kh.young.qna.dto.ExpertRespDto;
import com.kh.young.qna.dto.QuestionInsertDto;
import com.kh.young.qna.dto.QuestionRespDto;
import com.kh.young.qna.dto.ReplyRespDto;
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

	int insertReply(Reply r);
	ArrayList<ReplyRespDto> getReplyList(int boardNum);
	int deleteReply(int replyNum);

	int getScrapCount(int boardNum);
	int setScrap(Clip clip);
	int deleteScrap(Clip clip);

	int updateQuestion(QuestionInsertDto quest, HttpServletRequest request);
	int deleteQuestion(int boardNum);

	int getExpertsListCount();
	ArrayList<ExpertRespDto> selectExpertList(Integer page, int listCount);

	ChatPaymentRespDto getChatPaymentResp(String info);

	int updateIsSolved(int boardNum);





}
