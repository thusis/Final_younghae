package com.kh.young.qna.dto;

import java.sql.Date;

import com.kh.young.model.vo.Attachment;

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
	
	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private int boardView;
	private String boardStatus;
	private int userNum;
	private int boardType;
	
	private int answerNum;
	private int questionNum;
	private int proNum;
	
	private int replyCount;
	private int answerCount;
	private int scrapCount;
	
	private ExpertRespDto expertResp;
	private SupplementRespDto ansSresp;
	private Attachment ansAttach;
	
}
