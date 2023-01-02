package com.kh.young.qna.dto;

import com.kh.young.model.vo.Reply;

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
public class ReplyRespDto {
	private Reply reply;
	private String writerInfo;
}
