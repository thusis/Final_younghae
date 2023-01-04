package com.kh.young.story.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Story;
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

	public int insertStory(Story b) {
		return stDAO.insertStory(sqlSession, b);
	}

	public int insertThumbnail(Attachment att) {
		return stDAO.insertThumbnail(sqlSession, att);
	}

	public ArrayList<Story> allStory(PageInfo pi) {
		return stDAO.allStory(sqlSession, pi);
	}

	public Story selectStory(int boardNum) {
		return stDAO.selectStory(sqlSession, boardNum);
	}

	public int updateView(int boardNum) {
		return stDAO.updateView(sqlSession, boardNum);
	}

	public int bookmark(Story b) {
		return stDAO.insertBookmark(sqlSession, b);
	}

	public int DeleteBookmark(Story b) {
		return stDAO.deleteBookmark(sqlSession, b);
	}

	public Attachment selectThumbnail(int boardNum) {
		return stDAO.selectThumbnail(sqlSession, boardNum);
	}

	public int DeleteStory(int boardNum) {
		return stDAO.deleteStory(sqlSession, boardNum);
	}

	public int updateStory(Story s) {
		return stDAO.updateStory(sqlSession, s);
	}

	public int updateThumbnail(Story s) {
		return stDAO.updateThumbnail(sqlSession, s);
	}

	public Story checkBook(Story s){
		return stDAO.checkBook(sqlSession, s);
	}
}
