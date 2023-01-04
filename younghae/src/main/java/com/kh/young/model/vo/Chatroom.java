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
public class Chatroom {
	private int chatroomId;
	private Date chatroomTime;
	private int expertNum;
	private int userNum;
	private String chatroomStatus;
}
