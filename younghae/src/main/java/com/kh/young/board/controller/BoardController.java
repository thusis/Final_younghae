package com.kh.young.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.UUID;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.young.board.exception.boardException;
import com.kh.young.board.service.BoardService;
import com.kh.young.common.Pagination;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.Member;
import com.kh.young.model.vo.PageInfo;
import com.kh.young.model.vo.Reply;
import com.kh.young.model.vo.Story;
@SessionAttributes({"loginUser", "access_Token"})
@Controller
public class BoardController {
	@Autowired
	private BoardService bService;


   		//게시판 메인
		@RequestMapping("boardList.bo")
		public String boardList(HttpSession session, Model model, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="boardCategory", required=false) Integer boardCategory) {
			
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser);
		
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
		ArrayList<Board> topBoardList = bService.topBoardList();
		ArrayList<Attachment> topBoardAttList = bService.topBoardAttList();
		
		System.out.println("AllbList : " + bList);
		if(bList != null) {
			model.addAttribute("boardCategory", boardCategory);
			model.addAttribute("pi", pi);
			model.addAttribute("bList", bList);
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("topBoardList", topBoardList);
			model.addAttribute("topBoardAttList", topBoardAttList);
			return "boardList";
		} else {
			throw new boardException("Can't find BoardList");
		}
	}
	
	//게시글 작성 뷰
	@RequestMapping("boardWrite.bo")
	public String boardWrite(){
		return "boardWrite";
	}
	//게시글 작성
	@RequestMapping("insertBoard.bo")
	public String insertFile( HttpSession session,
		@RequestParam("thumbnail") String img,	
		@ModelAttribute Board b, HttpServletRequest request, Model model, @RequestParam("category") Integer category ) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNum = loginUser.getUserNum();
		b.setUserNum(userNum);
		b.setBoardType(category);
		
		int result1 = bService.insertBoard(b);
		
		Attachment attm = new Attachment();
		
		attm.setAttachName(img);
		attm.setAttachRename(img);
		attm.setAttachPath(img);
		attm.setBoardType(category);
		attm.setSerialNumber(b.getBoardNum());
		
		int att = bService.insertThumbnail(attm);
		
		if(result1 + att > 1) {
			return "redirect:boardList.bo";
		} else {
			throw new boardException("Can't insertBoard");
		}
		
	}
	
	//써머노트
	@RequestMapping("summernoteImage.bo")
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
	      
	      /**사진 이름 전송*/
	      out.println(renameFileName);
	      out.close();
	   }
	

	//게시글 상세보기
	@RequestMapping("boardView.bo")
	public String detailBoard(@RequestParam(value="boardCategory") int boardCategory, @RequestParam(value="boardNum") int boardNum, @RequestParam(value="writer") int writer,
											  @RequestParam(value = "page", required=false) Integer page, HttpServletRequest request, Model model) throws boardException{
			
			System.out.println("writer : " + writer);
			System.out.println("게시글 상세 boardNum : " + boardNum);
			System.out.println("게시글 상세 boardCategory : " + boardCategory);
			
			//b 모든 요소 뽑아오기 (attach까지 같이)
			Story b = bService.boardView(boardNum);
			System.out.println("게시글 상세보기 b : " + b);
			//탑 리스트
			ArrayList<Board> topBoardList = bService.topBoardList();
			ArrayList<Attachment> topBoardAttList = bService.topBoardAttList();
			//댓글
			ArrayList<Reply> rList = bService.replyList(boardNum);
			//댓글 수
			int replyCount = bService.replyCount(boardNum);
			System.out.println(replyCount);
			//좋아요
//			int likeCount = bService.likeCount(boardNum);
			
			if(b != null) {
				model.addAttribute("b", b);
				model.addAttribute("page", page);
				model.addAttribute("rList", rList);
				model.addAttribute("replyCount", replyCount);
				model.addAttribute("topBoardList", topBoardList);
				model.addAttribute("topBoardAttList", topBoardAttList);
//				model.addAttribute("likeCount", likeCount);
				return "boardDetail";
			} else {
				throw new boardException("Failed to Board details");
			}
			
	}

	

	// 글쓴이 정보 세팅
	private String writerInfoToString(Map paramap) {
		
		String info = "";
		
		Date thisyear = new Date(System.currentTimeMillis());
		SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
		
		int currentYear = Integer.parseInt(yyyy.format(thisyear));
		
		int birthYear = Integer.parseInt(paramap.get("USER_BIRTH").toString().split("-")[0]);
		int age = currentYear - birthYear + 1;
		info = (age/10) + "0 대";
		
		String gender = ((String) paramap.get("USER_GENDER")).trim().toString();
		
		if(gender.equals("F")) { info += " / 남"; }
		else if(gender.equals("M")) { info += " / 여"; }
		
		return info;
	}
	
	//게시글 수정
	@RequestMapping("updateBoard.bo")
	public String updateBoard(@RequestParam("boardNum") int boardNum,
										    @RequestParam(value="page", required=false) Integer page, 
											Model model, HttpSession session ) {
		Story b = bService.boardView(boardNum);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		model.addAttribute("b", b);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("page", page);
		return "boardEdit";
	}
	//게시글 update
	@RequestMapping("boardEdit.bo")
	public String boardEidt(@ModelAttribute Story b, @RequestParam("thumbnail") String image,
											@RequestParam("boardType") int boardType) {
		
		System.out.println("boardEdit 컨트롤러 들어옴?");
		System.out.println(b);
		
		
		
		String select = bService.selectThumbnail(b.getBoardNum()).getAttachRename();
		System.out.println("보드에딧 select : " + select);
		
		
		int attm = 0;
		if(image != null) {
			if(!select.contains(image)) {
				System.out.println("새로운 썸네일");
				if (!image.contains("<p")) {
					Attachment att = new Attachment();
					
					att.setAttachName(image);
					att.setAttachRename(image);
					att.setAttachPath(image);
					att.setBoardType(boardType);
					att.setSerialNumber(b.getBoardNum());
					
					b.setAttachment(att);
					
					
					attm = bService.updateThumbnail(b);
				}
			}
		}
		
		int bUpdate = bService.updateBoard(b);
		
		if(bUpdate + attm >= 1) {
			return "redirect:boardList.bo";
		} else {
			throw new boardException("게시글 수정 실패");
		}

	}
	
	
	//게시글 삭제
	@RequestMapping("deleteBoard.bo")
	public String deleteBoard(HttpSession session, @RequestParam(value="boardNum") int boardNum, Model model) {
		System.out.println(boardNum);
		int bDelete = bService.deleteBoard(boardNum);
		
		if(bDelete > 0) {
			return "redirect:boardList.bo";
		} else {			
			throw new boardException("게시글 삭제 실패");
		}
	}
	
	//조건식 검색
	@RequestMapping("search.bo")
	public String searchBoard(@RequestParam("searchCondition") String condition, Model model, 
												@RequestParam("searchValue") String value,
												@RequestParam(value="page", required=false) Integer page){
		System.out.println("search.bo 요청 들어오나?");
		HashMap<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("value", value);
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int searchListCount = bService.getSearchListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount, 6);
		map.put(condition, value);
		ArrayList<Board> bList = bService.searchList(map, pi);
		System.out.println("서치 리스트 받아오나? : " + bList);
		model.addAttribute("bList", bList);
		model.addAttribute("pi", pi);
		model.addAttribute("searchCondition", condition);
		model.addAttribute("searchValue", value);
		
		
		return "boardList";
	}
	
	//댓글 작성
	@RequestMapping("insertReply.bo")
	public void insertReply(HttpSession session, @ModelAttribute Reply r, HttpServletResponse response, @RequestParam("boardType") int boardType) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNum = loginUser.getUserNum();
		r.setBoardType(boardType);
		r.setUserNum(userNum);
		
		int result = bService.insertReply(r);
		ArrayList<Reply> rList = bService.replyList(r.getBoardNum());
		System.out.println("rList : " + rList);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb2.create();
		
		try {
			gson.toJson(rList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//댓글 삭제
	@RequestMapping("deleteReply.bo")
	public String deleteReply(@RequestParam("replyNum") int replyNum, Model model, @RequestParam("boardNum") int boardNum) {
			
		
			int rDelete = bService.deleteReply(replyNum);
			if(rDelete > 0) {
				ArrayList<Reply> rList = bService.replyList(boardNum);
				model.addAttribute("rList", rList);
				return "boardDetail";
			} else {
				throw new boardException("댓글 삭제 실패");
			}
			
	}
	
	//좋아요
	@RequestMapping("likeCount.bo")
	public String likeCheck(@RequestParam("boardNum") int boardNum) {
		return null;
	}
	
}
