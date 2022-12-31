package com.kh.young.story.controller;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Attachment;
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
	public String AllStoryList(@RequestParam(value = "page", required = false) Integer page, Model model) {
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		Member mem = sService.selectMember(27);
		System.out.println(mem);

		int listCount = stService.getStoryListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 4);
		
		ArrayList<Board> allList = stService.allStory(pi);
//		System.out.println(allList);
		
		if(allList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", allList);
			model.addAttribute("loginUser", mem);
			
//			System.out.println(allList);
			
//			return null;
			return "story";
		}else {
			throw new StoryException("story오류");
		}
		

	}

	// 스토리 작성하기
	@RequestMapping("insertStory.st")
	public String insertStory(@ModelAttribute Board b, @RequestParam("thumbnail") String image,
								HttpSession session) {
//		String nickName = ((Member) session.getAttribute("loginUser")).getUserNickname();
		String nickName = "ss";
//		int id = ((Member) session.getAttribute("loginUser")).getUserNum();
		
		System.out.println("controller"+image);
		
		System.out.println(b);
		
//		b.setUserNum(28);
		
		int result = stService.insertStory(b);
		int attm = 0;
		
		if(!image.contains("<p")) {
			// 컬럼 내용 복붙할때 이미지 경로가 이상하게 등록되는 오류 걸러내는 if문
			Attachment att = new Attachment();
			
			att.setAttachName(image);
			att.setAttachRename(image);
			att.setAttachPath(image);
			att.setBoardType(3);
			att.setSerialNumber(b.getBoardNum());
			
			attm = stService.insertThumbnail(att);
		}
		

		if(result + attm >= 1) {
			return null;
//			return "redirect:list.st";
		}else {
			throw new StoryException("컬럼 쓰기 실패");
		}
	}

	@RequestMapping("summernoteImage.st")
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root +  "\\summerNote";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
				+ originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 :" + e.getMessage());
		}
		
		System.out.println("파일경로 : " + renamePath);
		
		PrintWriter out = response.getWriter();
		
		// 사진 이름 전송
		out.println(renameFileName);
		out.close();
	}
	
	@RequestMapping("selectStory.st")
	public ModelAndView selectStory(@RequestParam("boardNum") int boardNum, @RequestParam("userNum") int userNum,
									@RequestParam(value = "page", required = false) Integer page,
								ModelAndView mv, HttpSession session) {
		System.out.println(boardNum);
		
		Board b = stService.selectStory(boardNum);
		
		System.out.println(b);
		
		Member m = (Member)session.getAttribute("loginUser");
		
		if(m.getUserNum() != userNum) {
			int result = stService.updateView(boardNum);
		}
		
		mv.addObject("board", b);
		mv.addObject("loginUser", m);
		mv.setViewName("story_Detail");
		
		return mv;
	}
}
