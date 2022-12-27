package com.kh.young.story.controller;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.story.exception.StoryException;
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
	
	// 스토리 작성하기
	@RequestMapping("insertStory.st")
	public String insertStory(@ModelAttribute Board b, HttpSession session) {
		String nickName = ((Member) session.getAttribute("loginUser")).getUserNickname();
		int id = ((Member) session.getAttribute("loginUser")).getUserNum();
		
//		int result = stService.insertStory(b);
		
		
		
//		if(result > 0) {
//			return "redirect:list.st";
//		}else {
//			throw new StoryException("컬럼 쓰기 실패");
//		}
		
		
		return null;
	}
	
	@RequestMapping("summernoteImage.st")
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		System.out.println(file.getOriginalFilename());
//		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("resources");
		String savePath = realFolder + "\\summerNoteUpload\\";
		
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
			// folder가 존재하지 않으면 make directory 폴더를 만들어줘
		}
		
		// 랜덤 이름 생성 준비
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int) (Math.random() * 100000);
		
		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = sdf.format(new Date(System.currentTimeMillis())) + ranNum
				+ org_filename.substring(org_filename.lastIndexOf("."));

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		System.out.println("파일경로 : " + savePath);
		
		file.transferTo(folder);
		out.println("summerNoteUpload/"+str_filename);
		out.close();
	}
}
