package com.kh.young.qna.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class SupplementRespDto {
	private int proNum;
	private String proImage;
	private String proName;
	private String proCompany;
	private String proEffect;
	private String cateName;
}
