package com.kh.young.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Reply;
import com.kh.young.model.vo.Story;

public interface BoardService {

	int getBoardListCount();

	ArrayList<Board> selectBoardList(PageInfo pi, Integer boardCategory);
	
	int insertBoard(Board b);

	int deleteBoard(int boardNum);

	Story boardView(int boardNum);

	int insertThumbnail(Attachment attm);
	
	int insertReply(Reply r);

	ArrayList<Reply> replyList(int boardNum);

	int getSearchListCount(HashMap<String, Object> map);

	ArrayList<Board> searchList(HashMap<String, Object> map, PageInfo pi);

	int replyCount(int boardNum);

	int deleteReply(int replyNum);

	Attachment selectThumbnail(int boardNum);

	int updateThumbnail(Story b);

	int updateBoard(Story b);

	ArrayList<Board> topBoardList();

	ArrayList<Attachment> topBoardAttList();





}
