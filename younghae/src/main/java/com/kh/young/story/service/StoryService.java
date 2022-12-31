package com.kh.young.story.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.story.dao.StoryDAO;

@Service("storyService")
public class StoryService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private StoryDAO stDAO;
	
	public int getStoryListCount() {
		return stDAO.getStoryListCount(sqlSession);
	}

	public int insertStory(Board b) {
		return stDAO.insertStory(sqlSession, b);
	}

	public int insertThumbnail(Attachment att) {
		return stDAO.insertThumbnail(sqlSession, att);
	}

	public ArrayList<Board> allStory(PageInfo pi) {
		return stDAO.allStory(sqlSession, pi);
	}

	public Board selectStory(int boardNum) {
		return stDAO.selectStory(sqlSession, boardNum);
	}

	public int updateView(int boardNum) {
		return stDAO.updateView(sqlSession, boardNum);
	}


}
