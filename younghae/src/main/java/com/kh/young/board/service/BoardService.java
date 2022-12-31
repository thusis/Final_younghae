package com.kh.young.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;

public interface BoardService {

	int getBoardListCount();

	ArrayList<Board> selectBoardList(PageInfo pi, Integer boardCategory);
	
	int insertBoard(Board b);

	int deleteBoard(int boardNo);

	int deletePhoto(int boardNo);

	Board boardView(int boardNum);

	int insertThumbnail(Attachment attm);
	
	//임시 로그인
	Member selectMember(int i);




}
