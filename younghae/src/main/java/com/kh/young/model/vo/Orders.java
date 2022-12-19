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
public class Orders {
	private int orderNum;
	private Date orderDate;
	private String userName;
	private String userZipcode;
	private String userAddress;
	private String userAddressDetail;
	private String userPhone;
	private int orderAmount;
	private String orderStatus;
	private String orderRefund;
	private String orderPayment;
	private int proNum;
	private int userNum;
	
}
