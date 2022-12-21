package com.kh.young.qna.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class QuestionInsertDto {

	private String boardTitle;
	private String boardContent;
	private String supplement; //영양제번호
	private MultipartFile attachment; //첨부파일 자체

}
