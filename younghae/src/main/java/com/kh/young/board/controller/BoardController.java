package com.kh.young.board.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
//import org.springframework.security.core.Authentication;
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

   		//게시판 메인
		@RequestMapping("boardList.bo")
		public String boardList(Model model, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="boardCategory", required=false) Integer boardCategory) {
	
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int boardListCount = bService.getBoardListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, boardListCount, 6);
		
		if(boardCategory == null) {
				boardCategory = 1;
		}

		System.out.println("boardCategory : " +  boardCategory);
		
		ArrayList<Board> bList = bService.selectBoardList(pi, boardCategory);
		ArrayList<Attachment> pList = bService.selectPhotoList(boardCategory);
		
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
	
	
	    //파일 저장소
		public String[] addFile(MultipartFile file, HttpServletRequest request) {
		
		 String root = request.getSession().getServletContext().getRealPath("resources");
	     String savePath = root + "\\uploadFiles";

	      File folder = new File(savePath);
	      if(!folder.exists()) {
	         folder.mkdirs();
	      }
	      
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	      int ranNum = (int)(Math.random()*100000);
	      String rawname = file.getOriginalFilename();
	      String rename = sdf.format(new Date(System.currentTimeMillis())) + ranNum + rawname.substring(rawname.lastIndexOf("."));
	      String fileRoute = folder + "\\" + rename;
	      

//	      String uploadPath = "C:/upload/";
//		UUID uuid  = UUID.randomUUID();
		
//		String originFileName = FilenameUtils.getBaseName(file.getOriginalFilename());
//		String renameFileName = uuid + "_" + originFileName;
//		String renameFileName =  "_" + originFileName;
		
//		File fileFolder = new File(uploadPath + renameFileName);
		
		try {
			file.transferTo(new File(fileRoute));
		} catch (Exception e) {
			System.out.println("File Transfer Error :" + e.getMessage());
		}
		
		String[] returnArr = new String[3];
		returnArr[0] = savePath;
		returnArr[1] = rename;
		returnArr[2] = rawname;
//		returnArr[2] = originFileName;
		System.out.println("파일저장소 나오나");
		return returnArr;
	}
	
	//게시글 작성 View
	@RequestMapping("boardWrite.bo")
	public String boardWrite(){
		return "boardWrite";
	}
	
	//게시글 작성 Insert
	@RequestMapping("insertBoard.bo")
	public String insertFile(
//		Authentication authentication, 
		@ModelAttribute Board b, @RequestParam("file") MultipartFile file, HttpServletRequest request, Model model, @RequestParam("category") Integer category ) {
//		int loginUser = (Member)session.getAttribute("loginUser");
		int userNum = 2;
		MultipartFile upload = file;
		
		Attachment photo = new Attachment();
		
		if(!upload.getOriginalFilename().equals("")) {
			String[] returnArr = addFile(upload, request);
			
			photo.setAttachPath(returnArr[0]);
			photo.setAttachRename(returnArr[1]);
			photo.setAttachName(returnArr[2]);
		}
		b.setBoardType(category);
		photo.setSerialNumber(b.getBoardNum());
		photo.setBoardType(category);
		
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

	//게시글 상세보기
	@RequestMapping("boardView.bo")
	public String detailBoard(@RequestParam(value="boardNum") int boardNum, @RequestParam(value="writer") int writer,
											  @RequestParam(value = "page", required=false) Integer page, Authentication authentication, HttpServletRequest request, Model model) throws boardException{
			
			System.out.println("writer : " + writer);
			Board b = bService.boardView(boardNum);
			Attachment photo = bService.photoView(boardNum);
			return "boardDetail";
	}
	
	//게시글 삭제
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
	
	//게시글 수정
	@RequestMapping("boardEdit.bo")
	public String boardEdit() {
		return "boardEdit";
	}
	
	//조건식 검색
	@RequestMapping()
	public String searchBoard() {
		return null;
	}
}
