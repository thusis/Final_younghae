package com.kh.young.shopping.dto;

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
public class SupplementResp {
	private int proNum;
	private String proImage;
	private String proName;
	private String proCompany;
	private String proIngredient;
	private int proPrice;
	private String proEffect;
	private String proIntake;
	private String proSaleStatus;
	private Date proCreateDate;
	private Date proModifyDate;
	private double proGrade;
	private String proStatus;
	private int cateNum;
	private String formatPrice;
	private int reviewCount;
}

