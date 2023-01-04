package com.kh.young.model.vo;

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
public class ChatReserv {
	private int reservId;
	private int chatroomId;
	private int orderNum;
	private String reservSchedule;
	private String isApproved;
	private String isCompleted;
	private int reservHowLong;
}
