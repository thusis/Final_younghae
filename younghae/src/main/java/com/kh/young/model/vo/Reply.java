package com.kh.young.model.vo;

import java.sql.Date;

import lombok.Data;

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
public class Reply {
	private int replyNum;
	private String replyContent;
	private Date replyDate;
	private String replyStatus;
	private int boardType;
	private int boardNum;
	private int userNum;
	private Member member;
}
