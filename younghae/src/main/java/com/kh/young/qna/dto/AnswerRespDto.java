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
public class AnswerRespDto {
	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private int boardView; //조회수
	private String boardStatus;
	private int userNum; //작성자 아이디
//	private int answerNum; //답글의 boardNum
	private int questionNum; //질문글번호
	private int proNum;
}
