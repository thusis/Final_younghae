package com.kh.young.shopping.dto;

import com.kh.young.model.vo.Address;
import com.kh.young.model.vo.Cart;

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
public class GetPayInfoDTO {
	private int userNum;
	private int proNum;
}
