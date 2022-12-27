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
public class Address {

	private int addressNum;
	private String addressName;
	private String addressAddressee;
	private String addressPhone;
	private int addressZipcode;
	private String addressBuilding;
	private String addressDetail;
	private String addressBasic;
	private int userNum;
	private String addressStatus;
}
