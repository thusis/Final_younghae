package com.kh.young.chat.dao;

import com.kh.young.model.vo.Chatroom;
import com.kh.young.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@ToString
public class GeneralcrDto {
	private Chatroom chatroom;
	private Member general;
}
