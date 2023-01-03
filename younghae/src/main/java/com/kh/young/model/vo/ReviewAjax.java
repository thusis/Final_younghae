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
public class ReviewAjax {
	private int rvNum;
	private int proNum;
	private int userNum;
	private String rvContent;
	private Date rvCreateDate;
	private Date rvMOdifyDate;
	private String rvStatus;
	private double rvStar;
	private String rvBuy;
	private String userNickname;
	private String image;
	private PageInfo pageinfo;
}
