package com.kh.young.model.vo;

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
public class Member {
	private int userNum;
	private String userId;
	private String userPwd;
	private String userName;
	private String userNickname;
	private String email;
	private String gender;
	private Date userBirth;
	private String userPhone;
	private String userRecommend;
	private Date userEnrollDate;
	private int userCNumber;
	private String userStatus;
	private Date userModifyDate;
	private int userPoint;
}
