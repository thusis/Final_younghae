package com.kh.young.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;

@Repository
public class BoardDAO {

	public int getBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getBoardListCount");
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, Integer boardCategory) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", boardCategory, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int insertThumbnail(SqlSessionTemplate sqlSession, Attachment attm) {
		return sqlSession.insert("boardMapper.insertThumbnail", attm);
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}

	public int deletePhoto(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deletePhoto", boardNo);
	}


	public int viewCount(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.update("boardMapper.viewCount", boardNum);
	}

	public Board boardView(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("boardMapper.boardView", boardNum);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("boardMapper.selectMember", i);
	}



	
}
