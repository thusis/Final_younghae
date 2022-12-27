package com.kh.young.story.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
