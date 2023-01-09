package com.kh.young.chat.service;

import com.kh.young.chat.dao.GeneralcrDto;
import com.kh.young.model.vo.ChatMessage;
import com.kh.young.model.vo.ChatReserv;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.model.vo.Member;
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
public class GeneralChatroomListDto {
	
	private int chatroomId;
	private Chatroom chatroom;
	private Member general;
	private ChatMessage lastMessage;
	private ChatReserv reserv;
	private int notReadCount;
	
	public GeneralChatroomListDto(GeneralcrDto g) {
		this.chatroomId = g.getChatroom().getChatroomId();
		this.chatroom = g.getChatroom();
		this.general = g.getGeneral();
	}

}
