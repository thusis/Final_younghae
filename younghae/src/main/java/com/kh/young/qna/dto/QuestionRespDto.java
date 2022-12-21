package com.kh.young.qna.dto;

import java.sql.Date;

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
	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private int boardView; //조회수
	private int userNum; //작성자 아이디 => 작성자 
	private int proNum; //제품번호
	private String isSolved; //해결여부
	
	private int answerCount;
	private int replyCount;
	private int scrapCount;
}
