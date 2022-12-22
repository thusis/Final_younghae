package com.kh.young.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.PageInfo;

@Repository
public class BoardDAO {

	public int getBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getBoardListCount");
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", null, rowBounds);
	}

	public ArrayList<Attachment> selectPhotoList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectPhotoList");
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int insertPhoto(SqlSessionTemplate sqlSession, Attachment photo) {
		return sqlSession.insert("boardMapper.insertPhoto", photo);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}

	public int deletePhoto(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deletePhoto", boardNo);
	}
	
}
