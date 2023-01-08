package com.kh.young.chat.service;

import java.util.ArrayList;

import com.kh.young.chat.dao.ExpertcrDto;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.ChatReserv;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.qna.dto.ExpertRespDto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ExpertChatroomDto {
	
	private int chatroomId;
	private Chatroom chatroom;
	private ExpertRespDto expert;
	private ArrayList<ChatMessage> messageList;
	private ChatReserv reserv;
	
	public ExpertChatroomDto(ExpertcrDto e) {
		this.chatroomId = e.getChatroom().getChatroomId();
		this.chatroom = e.getChatroom();
		this.expert = e.getExpert();
	}
	
}
