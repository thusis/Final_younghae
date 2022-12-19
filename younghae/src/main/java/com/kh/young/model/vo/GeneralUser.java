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
public class GeneralUser {
	private int userNum;
	private String userZipcode;
	private String userAddress;
	private String userAddressDetail;
	private String userHealth;
}
