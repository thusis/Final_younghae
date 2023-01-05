package com.kh.young.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.board.dao.BoardDAO;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Reply;
import com.kh.young.model.vo.Story;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDAO bDAO;
	
	
	  @Override public int getBoardListCount() { 
		return bDAO.getBoardListCount(sqlSession);
	 }
	 

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, Integer boardCategory) {
		return bDAO.selectBoardList(sqlSession, pi, boardCategory);
	}

	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession, b);
	}

	
	@Override
	public int deleteBoard(int boardNo) {
		return bDAO.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public Story boardView(int boardNum) {
		int viewCount = bDAO.viewCount(sqlSession, boardNum);
		Story b = bDAO.boardView(sqlSession, boardNum);
		return b;
	}


	@Override
	public int insertThumbnail(Attachment attm) {
		return bDAO.insertThumbnail(sqlSession, attm);
	}


	@Override
	public int insertReply(Reply r) {
		return bDAO.insertReply(sqlSession, r);
	}


	@Override
	public ArrayList<Reply> replyList(int boardNum) {
		return bDAO.replyList(sqlSession, boardNum);
	}


	@Override
	public int getSearchListCount(HashMap<String, Object> map) {
		return bDAO.getSearchListCount(sqlSession, map);
	}


	@Override
	public ArrayList<Board> searchList(HashMap<String, Object> map, PageInfo pi) {
		return bDAO.searchList(sqlSession, map, pi);
	}


	@Override
	public int replyCount(int boardNum) {
		return bDAO.replyCount(sqlSession, boardNum);
	}


	@Override
	public int deleteReply(int replyNum) {
		return bDAO.deleteReply(sqlSession, replyNum);
	}


	@Override
	public Attachment selectThumbnail(int boardNum) {
		return bDAO.selectThumbnail(sqlSession, boardNum);
	}

	
	@Override
	public int updateBoard(Story b) {
		return bDAO.updateBoard(sqlSession, b);
	}

	@Override
	public int updateThumbnail(Story b) {
		return bDAO.updateThumbnail(sqlSession, b);
	}


	@Override
	public ArrayList<Board> topBoardList() {
		return bDAO.topBoardList(sqlSession);
	}


	@Override
	public ArrayList<Attachment> topBoardAttList() {
		return bDAO.topBoardAttList(sqlSession);
	}






}
