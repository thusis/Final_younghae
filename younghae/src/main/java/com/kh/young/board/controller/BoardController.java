package com.kh.young.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.young.board.exception.boardException;
import com.kh.young.board.service.BoardService;
import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.PageInfo;
//@SessionAttributes("loginUser")
@Controller
public class BoardController {
	@Autowired
	private BoardService bService;

   @GetMapping("login.bo")
   public String loginHome(@RequestParam("userNum") Integer userNum, HttpServletRequest request) {
      bService.setLoginUser(userNum, request);
      return "redirect:boardList.bo";
   }
   
   @RequestMapping("logout.bo")
   public String logoutHome(HttpServletRequest request) {
	   ServletContext application = request.getSession().getServletContext();
	   application.setAttribute("loginUser",null);
	   return "redirect:boardList.bo";
   }
	//Board Main

	@RequestMapping("boardList.bo")
	public String boardList(@RequestParam(value="page", required=false) Integer page, Model model) {
	
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int boardListCount = bService.getBoardListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, boardListCount, 6);
		
		ArrayList<Board> bList = bService.selectBoardList(pi);
		ArrayList<Attachment> pList = bService.selectPhotoList();
		
		System.out.println("bList : " + bList);
		System.out.println("pList : " + pList);
		if(bList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("bList", bList);
			model.addAttribute("pList", pList);
			return "boardList";
		} else {
			throw new boardException("Can't find BoardList");
		}
	}
	
	
	//File resources

	public String[] addFile(MultipartFile file, HttpServletRequest request) {
		String uploadPath = "C:/upload/";
		
		UUID uuid  = UUID.randomUUID();
		
		String originFileName = FilenameUtils.getBaseName(file.getOriginalFilename());
		String renameFileName = uuid + "_" + originFileName;
		
		File fileFolder = new File(uploadPath + renameFileName);
		
		try {
			file.transferTo(fileFolder);
		} catch (Exception e) {
			System.out.println("File Transfer Error :" + e.getMessage());
		}
		
		String[] returnArr = new String[3];
		returnArr[0] = uploadPath;
		returnArr[1] = renameFileName;
		returnArr[2] = originFileName;
		System.out.println("파일저장소 나오나");
		return returnArr;
	}
	
	//boardWrite View
	@RequestMapping("boardWrite.bo")
	public String boardWrite(){
		return "boardWrite";
	}
	
	//boardInsert(+ photo)
	@RequestMapping("insertBoard.bo")
	public String insertFile(Authentication authentication, @ModelAttribute Board b, @RequestParam("file") MultipartFile file, HttpServletRequest request, Model model ) {
//		int loginUser = (Member)session.getAttribute("loginUser");
		
		MultipartFile upload = file;
		
		Attachment photo = new Attachment();
		
		if(!upload.getOriginalFilename().equals("")) {
			String[] returnArr = addFile(upload, request);
			
			photo.setAttachName(returnArr[2]);
			photo.setAttachRename(returnArr[1]);
			photo.setAttachPath(returnArr[0]);
		}
		
		photo.setSerialNumber(b.getBoardNum());
		
		System.out.println("photo : " + photo);
		int result1 = bService.insertBoard(b);
		int result2 = bService.insertPhoto(photo);
		
		if(result2 > 0 && result1 > 0) {
			model.addAttribute("photoName", photo.getAttachName());
			return "redirect:boardList.bo";
		} else {
			throw new boardException("Can't insertBoard");
		}
		
	}

	//boardDetail
	@RequestMapping("detailBoard.bo")
	public String detailBoard(Authentication authentication, HttpServletRequest request, @RequestParam(value = "page", required=false) Integer page, Model model, @RequestParam(value="serialNumber", required=false) int boardNo, @RequestParam(value="attachName", required=false) String photoName) {
		
		Board b = new Board();
		Attachment photo = new Attachment();
		
		if(b != null && photo != null) {
			model.addAttribute("b", b);
			model.addAttribute("photo", photo);
			return "boardDetail";
		} else {
			throw new boardException("게시글 상세조회 실패");			
		}
	}
	
	//deleteBoard
	@RequestMapping("deleteBoard.bo")
	public String deleteBoard(HttpSession session, @RequestParam(value="serialNumber", required=false) int boardNo, Model model) {
		
		int result1 = bService.deleteBoard(boardNo);
		int result2 = bService.deletePhoto(boardNo);
		
		if(result1 > 0 && result2 > 0) {
			model.addAttribute("result1", result1);
			model.addAttribute("result2", result2);
			return "boardDetail";
		} else {			
			throw new boardException("게시글 삭제 실패");
		}
	}
	
}
