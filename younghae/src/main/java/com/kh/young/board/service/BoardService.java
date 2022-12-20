package com.kh.young.board.service;

import java.util.ArrayList;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.PageInfo;

public interface BoardService {

	int getBoardListCount();

	ArrayList<Board> selectBoardList(PageInfo pi);

	ArrayList<Attachment> selectPhotoList();

	int insertBoard(Board b);

	int insertPhoto(Attachment photo);

	int deleteBoard(int boardNo);

	int deletePhoto(int boardNo);


}
