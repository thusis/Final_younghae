package com.kh.young.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.board.dao.BoardDAO;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDAO bDAO;
	
	@Override
	public int getBoardListCount() {
		return bDAO.getBoardListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return bDAO.selectBoardList(sqlSession, pi);
	}

	@Override
	public ArrayList<Attachment> selectPhotoList() {
		return bDAO.selectPhotoList(sqlSession);
	}

}
