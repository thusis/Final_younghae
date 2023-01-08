package com.kh.young.chat.dao;
import com.kh.young.model.vo.Chatroom;
import com.kh.young.qna.dto.ExpertRespDto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@ToString
public class ExpertcrDto {
	private Chatroom chatroom;
	private ExpertRespDto expert;
}

