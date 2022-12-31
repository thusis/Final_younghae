package com.kh.young.board.service;

import java.util.ArrayList;

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
	public int deletePhoto(int boardNo) {
		return bDAO.deletePhoto(sqlSession, boardNo);
	}


	@Override
	public Board boardView(int boardNum) {
		int viewCount = bDAO.viewCount(sqlSession, boardNum);
		Board b = bDAO.boardView(sqlSession, boardNum);
		return b;
	}


	@Override
	public int insertThumbnail(Attachment attm) {
		return bDAO.insertThumbnail(sqlSession, attm);
	}


	@Override
	public Member selectMember(int i) {
		return bDAO.selectMember(sqlSession, i);
	}



}
