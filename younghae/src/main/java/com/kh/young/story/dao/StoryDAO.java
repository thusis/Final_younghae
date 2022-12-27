package com.kh.young.story.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.PageInfo;

@Repository("storyDAO")
public class StoryDAO {

	public int getStoryListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storyMapper.getStoryListCount");
	}
	
	public ArrayList<Board> allStory(SqlSessionTemplate sqlSession,  PageInfo pi ){
		//로우 바운드 사용 ( 오프셋, 보드리밋 )
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storyMapper.allStory",  3 ,rowBounds );
	}

}
