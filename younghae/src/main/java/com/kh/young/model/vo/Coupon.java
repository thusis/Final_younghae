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
public class Coupon {
	private String couNumber;
	private Date couPublishDate;
	private Date couEndDate;
	private String couUsed;
	private int couDiscount;
	private String couIntro;
	private int userNum;
	private String couRegister;
}
