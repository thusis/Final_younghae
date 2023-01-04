package com.kh.young.qna.dto;

import java.util.ArrayList;

import com.kh.young.model.vo.Answer;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Clip;
import com.kh.young.model.vo.Question;
import com.kh.young.model.vo.Reply;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class QuestionRespDto {
	
	private Board board;
	private Question question;
	private Attachment qattach;
	private SupplementRespDto sresp;

	private String writerInfo;

	private ArrayList<AnswerRespDto> answerList;
	private ArrayList<ReplyRespDto> replyList;
	private ArrayList<Clip> scrapList; 
	
	private int scrapListSize;
	
	
//	private int boardNum;
//	private String boardTitle;
//	private String boardContent;
//	private Date boardCreateDate;
//	private Date boardModifyDate;
//	private int boardView;
//	private String boardStatus;
//	private int userNum;
//	private int boardType;
//	
//	private int questionNum;
//	private int proNum;
//	private String isRead;
//	private String isSolved;
//	
//	private String writerInfo;
//	private int replyCount;
//	private int answerCount;
//	private int scrapCount;
//	
//	private SupplementRespDto sresp;
//	private Attachment qattach;
}
