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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Story;
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
	public String AllStoryList(@RequestParam(value = "page", required = false) Integer page, HttpSession session,Model model) {
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		Member mem = (Member)session.getAttribute("loginUser");
		System.out.println(mem);

		int listCount = stService.getStoryListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 4);

		ArrayList<Story> allList = stService.allStory(pi);
		
			
		for(int i = 0; i < allList.size(); i++) {
			if(mem != null) {
				System.out.println("null아님");
				Story r = stService.checkBook(allList.get(i));
				
				if(stService.checkBook(allList.get(i)) != null) {
					if(allList.get(i).getBoardNum() == r.getClip().getBoardNum() && mem.getUserNum() == r.getClip().getUserNum()) {
						allList.get(i).setCheck("Y");
					}
				}else {
					allList.get(i).setCheck("N");
				}
			}else {
				System.out.println("null임");
				allList.get(i).setCheck("N");
			}
			System.out.println(allList.get(i).getBoardNum());
		}
		
//		System.out.println(allList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", allList);
		model.addAttribute("loginUser", mem);

		return "story";

	}

	// 스토리 작성하기
	@RequestMapping("insertStory.st")
	public String insertStory(@ModelAttribute Story b, @RequestParam("thumbnail") String image, HttpSession session) {
		String nickName = ((Member) session.getAttribute("loginUser")).getUserNickname();
		int id = ((Member) session.getAttribute("loginUser")).getUserNum();

		System.out.println("controller" + image);

		System.out.println(b);
		
		b.setUserNum(id);

		int result = stService.insertStory(b);
		int attm = 0;

		if (!image.contains("<p")) {
			// 컬럼 내용 복붙할때 이미지 경로가 이상하게 등록되는 오류 걸러내는 if문
			Attachment att = new Attachment();

			att.setAttachName(image);
			att.setAttachRename(image);
			att.setAttachPath(image);
			att.setBoardType(3);
			att.setSerialNumber(b.getBoardNum());

			attm = stService.insertThumbnail(att);
		}

		if (result + attm >= 1) {
//			return null;
			return "redirect:AdminStoryList.st";
		} else {
			throw new StoryException("컬럼 쓰기 실패");
		}
	}

	@RequestMapping("summernoteImage.st")
	public void profileUpload(MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\summerNote";

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int) (Math.random() * 100000);

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
			@RequestParam(value = "page", required = false) Integer page, ModelAndView mv, HttpSession session) {
		System.out.println(boardNum);

		Story b = stService.selectStory(boardNum);

		System.out.println(b);

		Member m = (Member) session.getAttribute("loginUser");
		
		if(m == null) {
			int result = stService.updateView(boardNum);
		}else {
			if (m.getUserNum() != userNum) {
				int result = stService.updateView(boardNum);
			}
		}


		mv.addObject("board", b);
		mv.addObject("loginUser", m);
		mv.addObject("page", page);
		mv.setViewName("story_Detail");

		return mv;
	}

	@RequestMapping("bookmark.st")
	@ResponseBody
	public Integer bookmark(@RequestParam("boardNum") int boardNum, @RequestParam("userNum") int userNum,
			@RequestParam("check") String check) {
		int result = 0;
		
		// 보드로 설정
		Story b = new Story();
		
		// 여기서 userNum은 보드를 쓴 사람이 아님(=로그인 유저), 그냥 담을 곳이 없어서 넣어서 보낸거임
		b.setUserNum(userNum);
		b.setBoardNum(boardNum);

		System.out.println(check);

		if (check.equals("N")) {
			System.out.println("delete 들어옴");
			result = stService.DeleteBookmark(b);
		} else if (check.equals("Y")) {
			System.out.println("insert 들어옴");
			result = stService.bookmark(b);
		}

		return result;
	}
	
//======================관리자 페이지===============================================================================================================
	
	@RequestMapping("selectUpdateStory.st")
	public ModelAndView selectUpdateStory(@RequestParam("boardNum") int boardNum, @RequestParam("userNum") int userNum,
			@RequestParam(value = "page", required = false) Integer page, ModelAndView mv, HttpSession session) {
		System.out.println(boardNum);

		Story s = stService.selectStory(boardNum);

		Member m = (Member) session.getAttribute("loginUser");
		
		System.out.println( s.getBoardTitle() );

		mv.addObject("story", s);
		mv.addObject("loginUser", m);
		mv.addObject("page", page);
		mv.setViewName("story_update");

		return mv;
	}
	
	@RequestMapping("updateStory.st")
	public String updateStory(@ModelAttribute Story s, @RequestParam("check") String check, @RequestParam("thumbnail") String image) {
		System.out.println("updateController 들어옴");
		System.out.println(s);
		
		String select = stService.selectThumbnail(s.getBoardNum()).getAttachRename();
		System.out.println(select);
		
		int attm = 0;
		if(image != null) {
			if(!select.contains(image)) {
				System.out.println("새로운 썸네일");
				if (!image.contains("<p")) {
					Attachment att = new Attachment();
					
					att.setAttachName(image);
					att.setAttachRename(image);
					att.setAttachPath(image);
					att.setBoardType(3);
					att.setSerialNumber(s.getBoardNum());
					
					s.setAttachment(att);
					
					attm = stService.updateThumbnail(s);
				}
			}
		}
		
		int result = 0;
		if(check.equals("D")) {
			System.out.println("D");
			result = stService.DeleteStory(s.getBoardNum());
		}else if(check.equals("U")) {
			System.out.println("U");
			result = stService.updateStory(s);
		}
		
		if( result + attm >= 1) {
			return "redirect:AdminStoryList.st";
		}else {
			throw new StoryException("컬럼 쓰기 실패");
		}
		
	}
	
	@RequestMapping("AdminStoryList.st")
	public String AdminAllStoryList(@RequestParam(value = "page", required = false) Integer page, HttpSession session, Model model) {
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		Member mem = (Member)session.getAttribute("loginUser");
		System.out.println(mem);

		int listCount = stService.getStoryListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 4);

		ArrayList<Story> allList = stService.allStory(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", allList);
		model.addAttribute("loginUser", mem);

		return "admin_StoryPage";

	}
	
	@RequestMapping("trash.st")
	public String trash(@RequestParam("boardNum") int boardNum, @RequestParam("check") String check) {
		int result = 0;
		// 보드로 설정
		
		System.out.println(check);

		if (check.equals("Y")) {
			System.out.println("delete 들어옴");
			result = stService.DeleteStory(boardNum);
		}else if(check.equals("N")) {
			Story s = stService.selectStory(boardNum);
			result = stService.updateStory(s);
		}
		
		return "admin_StoryPage";

	}
	
	@RequestMapping("AdminwriteStory.st")
	public String AdminwriteStory() {
		return "story_write";
	}
}
