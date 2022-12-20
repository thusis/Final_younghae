package com.kh.young.qna.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class QuestionInsertDto {

	private String boardTitle;
		private String boardContent;
		private String supplement; //영양제번호
		private MultipartFile attachment; //첨부파일 자체

}
