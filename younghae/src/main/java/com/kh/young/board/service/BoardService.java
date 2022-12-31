package com.kh.young.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.PageInfo;

public interface BoardService {

	int getBoardListCount();

	ArrayList<Board> selectBoardList(PageInfo pi, Integer boardCategory);

	ArrayList<Attachment> selectPhotoList(Integer boardCategory);
	
	int insertBoard(Board b);

	int insertPhoto(Attachment photo);

	int deleteBoard(int boardNo);

	int deletePhoto(int boardNo);

	void setLoginUser(Integer userNum, HttpServletRequest request);

	Board boardView(int boardNum);

	Attachment photoView(int boardNum);




}
