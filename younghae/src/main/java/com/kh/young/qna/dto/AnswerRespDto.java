package com.kh.young.qna.dto;

import java.util.ArrayList;

import com.kh.young.model.vo.Answer;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
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
public class AnswerRespDto {
	
	private Board board;
	private Answer answer;
	private SupplementRespDto sresp;
	private Attachment aattach;

	private ExpertRespDto eresp;

	private ArrayList<ReplyRespDto> replyList;

	
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
//	private int answerNum;
//	private int questionNum;
//	private int proNum;
//	
//	private int replyCount;
//	private int scrapCount;
//	
//	private ExpertRespDto expertResp;
//	private SupplementRespDto ansSresp;
//	private Attachment ansAttach;
	
}
