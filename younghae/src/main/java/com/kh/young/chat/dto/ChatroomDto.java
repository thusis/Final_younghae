package com.kh.young.chat.dto;

import java.util.ArrayList;

import com.kh.young.model.vo.ChatMessage;
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
public class ChatroomDto {

	private Chatroom chatroom;
	
	private ExpertRespDto expert; // 대답하는 전문가 -> expert.getMember().getUserNum() 이 expertNum
	private Member general;
	
	private String lastMessage;
	private int notReadCount; //loginUserNum 기준
	private String isPaid; //결제 여부
	private String latestSendTime;
	
	private ArrayList<ChatMessage> messageList;
}
