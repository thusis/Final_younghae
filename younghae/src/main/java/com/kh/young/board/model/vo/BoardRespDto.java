package com.kh.young.board.model.vo;

import java.util.ArrayList;

import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.ReplyRespDto;

public class BoardRespDto {
	private Board board;
	private Member member;
	private String writerInfo;
	private ArrayList<ReplyRespDto> replyList;

}
