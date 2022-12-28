package com.kh.young.qna.dto;

import java.util.ArrayList;

import com.kh.young.model.vo.Attachment;
import com.kh.young.model.vo.ExpertUser;
import com.kh.young.model.vo.Member;

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
	
	private Member member;
	private ExpertUser expert;
	private Attachment eattach;
	
	private int answerListSize;
	private ArrayList<AnswerRespDto> answerList;

//	private int userNum;
//	private String userId;
//	private String userName;
//	private String userNickname;
//	
//	private int answerCount;
//	
//	private String expertPostAdd;
//	private String expertAddress;
//	private String expertAddDetail;
//	private String expertSort;
//	private String expertMedi;
//	private String expertDept;
//	private String expertProfile;
//	private String expertHomepage;
//	private String expertCareer;
//	
//	private int attachNum; //프로필사진
//	private Attachment expertAttach;
}
