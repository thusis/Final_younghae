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
	private String orderCode;
	private int userNum;
	private String userId;
	private String orderDate;
	private String orderStatus;
	private int orderPayAmount;
	private int orderTotalPrice;
	private String orderUserName;
	private String orderPaymethod;
	private int orderCouponPrice;
	private String orderImpCode;
	private String orderPhone;
	private int addressNum;
	private String orderRequest;
}
