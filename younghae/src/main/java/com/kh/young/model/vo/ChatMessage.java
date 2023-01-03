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
public class ChatMessage {
	private int chatId;
	private String chatContent;
	private String sendTime; //DB에는 date 인데 String 타입으로(TO_CHAR) 변환해서 받을 것
	private String isRead;
	private int chatroomId;
	private int senderNum;
	private int receiverNum; //받을 사람 
}
