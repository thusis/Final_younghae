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
public class MemberRespDto {
	private int userNum;
	private String userId;
	private String userNickname;
	private String gender;
	private Date userBirth;
}
