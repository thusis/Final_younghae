package com.kh.young.story.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.story.service.StoryService;
import com.kh.young.supplement.service.SupplementService;

@SessionAttributes("loginUser")
@Controller
public class StoryController {
	
	@Autowired
	private StoryService stService;
	
	@Autowired
	private SupplementService sService;
	
	@RequestMapping("storyList.st")
	public String AllStoryList(@RequestParam(value="page",  required=false) Integer page, Model model) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		Member mem = sService.selectMember(9);
		
		int listCount = stService.getStoryListCount();
		
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount, 4);
		
		return null;
	}
}
