package com.kh.young.chat.dto;

import java.util.ArrayList;

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
@Getter
@Setter
@ToString
public class ChatroomListDto {

	private Chatroom chatroom;
	/*CHATROOM_ID CHATROOM_TIME EXPERT_NUM USER_NUM CHATROOM_STATUS*/
	
	private ExpertRespDto expert; // 대답하는 전문가 -> expert.getMember().getUserNum() 이 expertNum
	private Member general;
	
	private int notReadCount; //loginUserNum 기준
	private ChatMessage lastMessage;
	/*CHAT_ID CHAT_CONTENT lastMessageContent SEND_TIME lastMessageSendTime IS_READ
	 *CHATROOM_ID SENDER_NUM RECEIVER_NUM */
	
	private ChatReserv reserv;
	/*
	 * private int reservId; private int chatroomId; private int orderNum; private
	 * String reservSchedule; private String isApproved; private String isCompleted;
	 * private int reservHowLong;
	 */
}
