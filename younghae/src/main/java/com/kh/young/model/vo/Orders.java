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
public class Orders {
	private int orderNum;
//	-이거
	private String orderCode;
	private int userNum;
	private int userId;
	private String orderDate;
	private String orderStatus;
	private int orderPayAmount;
	private int orderTotalPrice;
//	-이거
	private String orderUserName;
	private String orderPaymethod;
	private int orderCouponPrice;
//	-이거
	private String orderImpCode;
	private String orderPhone;
	private int addressNum;
//	-이거
}
