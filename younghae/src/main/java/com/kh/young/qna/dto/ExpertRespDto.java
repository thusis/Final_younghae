package com.kh.young.qna.dto;

import java.sql.Date;

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
public class ExpertRespDto { //답변, 프로필
	private int userNum;
	private String userId;
	private String userName;
	private String userNickname;
	
	private int answerCount;
	
	private String expertPostAdd;
	private String expertAddress;
	private String expertAddDetail;
	private String expertSort;
	private String expertMedi;
	private String expertDept;
	private String expertProfile;
	private String expertHomepage;
	private String expertCareer;
	
	private int attachNum; //프로필사진

}
