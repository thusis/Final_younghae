package com.kh.young.chat.dto;

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
public class ChatPaymentRespDto {
	
	private Chatroom chatroom;
	private Member generalUser;
	private ExpertRespDto expertUser;

}
