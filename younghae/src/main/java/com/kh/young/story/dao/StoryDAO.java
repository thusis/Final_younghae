package com.kh.young.story.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Story;

@Repository("storyDAO")
public class StoryDAO {

	public int getStoryListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storyMapper.getStoryListCount");
	}
	
	public ArrayList<Story> allStory(SqlSessionTemplate sqlSession,  PageInfo pi ){
		//로우 바운드 사용 ( 오프셋, 보드리밋 )
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storyMapper.allStory",  3 ,rowBounds );
	}

	public int insertStory(SqlSessionTemplate sqlSession, Story b) {
		return sqlSession.insert("storyMapper.insertStory", b);
	}

	public int insertThumbnail(SqlSessionTemplate sqlSession, Attachment att) {
		return sqlSession.insert("storyMapper.insertThumbnail", att);
	}

	public Story selectStory(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("storyMapper.selectStory", boardNum);
	}

	public int updateView(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.update("storyMapper.updateView", boardNum);
	}

	public int insertBookmark(SqlSessionTemplate sqlSession, Story b) {
		return sqlSession.insert("storyMapper.insertBookmark", b);
	}

	public int deleteBookmark(SqlSessionTemplate sqlSession, Story b) {
		return sqlSession.delete("storyMapper.deleteBookmark", b);
	}

	public Attachment selectThumbnail(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.selectOne("storyMapper.selectThunbnail", boardNum);
	}

	public int deleteStory(SqlSessionTemplate sqlSession, int boardNum) {
		return sqlSession.update("storyMapper.deleteStory", boardNum);
	}

	public int updateStory(SqlSessionTemplate sqlSession, Story s) {
		return sqlSession.update("storyMapper.updateStory", s);
	}

	public int updateThumbnail(SqlSessionTemplate sqlSession, Story s) {
		return sqlSession.update("storyMapper.updateThumbnail", s);
	}
	
	public Story checkBook(SqlSessionTemplate sqlSession, Story s){
		return sqlSession.selectOne("storyMapper.checkBook", s);
	}

}
