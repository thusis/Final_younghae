package com.kh.young.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.young.board.pagination.BoardPagination;
import com.kh.young.board.service.BoardService;
import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.Board;
import com.kh.young.model.vo.PageInfo;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	//게시판 메인
	@RequestMapping("boardList.bo")
	public String boardList(@RequestParam(value="page", required=false) Integer page, Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int boardListCount = bService.getBoardListCount();
		PageInfo pi = BoardPagination.getPageInfo(currentPage, boardListCount, 6);
		
		ArrayList<Board> bList = bService.selectBoardList(pi);
		ArrayList<Attachment> pList = bService.selectPhotoList();
		
		return "boardList";
	}
	
	
	//파일 저장소 생성
	public String[] addFile(MultipartFile file, HttpServletRequest request) {
		String uploadPath = "C:/upload/";
		
		UUID uuid  = UUID.randomUUID();
		
		String originFileName = FilenameUtils.getBaseName(file.getOriginalFilename());
		String renameFileName = uuid + "_" + originFileName;
		
		File fileFolder = new File(uploadPath + renameFileName);
		
		try {
			file.transferTo(fileFolder);
		} catch (Exception e) {
			System.out.println("파일 전송 에러 :" + e.getMessage());
		}
		
		String[] returnArr = new String[3];
		returnArr[0] = uploadPath;
		returnArr[1] = renameFileName;
		returnArr[2] = originFileName;

		return returnArr;
	}
	
	//파일 insert
	

	//게시글 insert
	
}
