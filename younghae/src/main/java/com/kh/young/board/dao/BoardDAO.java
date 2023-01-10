package com.kh.young.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Declaration;
import com.kh.young.model.vo.Likes;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Reply;
import com.kh.young.model.vo.Story;

@Repository
public class BoardDAO {

	public int getBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getBoardListCount");
	}

	public ArrayList<Story> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, Integer boardCategory) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Story> boardList = (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", boardCategory, rowBounds);
		for(Story b : boardList) {
			Likes paraLike = new Likes(b.getUserNum(), b.getBoardNum(), b.getBoardType());
			b.setLikeCount(sqlSession.selectOne("boardMapper.likeCount", paraLike));
			b.setReplyCount(sqlSession.selectOne("boardMapper.replyCount", b.getBoardNum()));
			
			System.out.println("Dao Like Reply : " + b);
		}
		return boardList;
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

	public int viewCount(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.update("boardMapper.viewCount", boardNum);
	}

	public Story boardView(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("boardMapper.boardView", boardNum);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("boardMapper.selectMember", i);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public ArrayList<Reply> replyList(SqlSessionTemplate sqlSession, int boardNum) {
		ArrayList<Reply> rList = new ArrayList<Reply>();
		rList = (ArrayList)sqlSession.selectList("boardMapper.replyList", boardNum);
		return rList;
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", map);
	}

	public ArrayList<Board> searchList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds row = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.searchList", map, row);
	}

	public int replyCount(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("boardMapper.replyCount", boardNum);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int replyNum) {
		return sqlSession.update("boardMapper.deleteReply", replyNum);
	}

	public Attachment selectThumbnail(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("boardMapper.selectThumbnail", boardNum);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Story b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int updateThumbnail(SqlSessionTemplate sqlSession, Story b) {
		return sqlSession.update("boardMapper.updateThumbnail", b);
	}

	public ArrayList<Board> topBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.topBoardList");
	}

	public ArrayList<Attachment> topBoardAttList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.topBoardAttList");
	}

	public int likeCheck(SqlSessionTemplate sqlSession, Likes like) {
		return sqlSession.selectOne("boardMapper.likeCheck", like);
	}

	public void likeInsert(SqlSessionTemplate sqlSession, Likes like) {
		sqlSession.insert("boardMapper.likeInsert", like);
	}

	public void likeDelete(SqlSessionTemplate sqlSession, Likes like) {
		sqlSession.delete("boardMapper.likeDelete", like);
	}

	public int likeCount(SqlSessionTemplate sqlSession, Likes like) {
		return sqlSession.selectOne("boardMapper.likeCount", like);
	}

	public int insertDeclare(SqlSessionTemplate sqlSession, Declaration declare) {
		return sqlSession.insert("boardMapper.insertDeclare", declare);
	}

	public int selectDclMsg(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("boardMapper.selectDclMsg", boardNum);
	}



	
}
