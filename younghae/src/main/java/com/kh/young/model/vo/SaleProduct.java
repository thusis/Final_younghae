package com.kh.young.model.vo;

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
public class SaleProduct {
	private int proNum;
	private String proDetail;
	private String proCate;
	private int proDiscountRate;
	private int proReducedPrice;
	private int proViewCount;
}
