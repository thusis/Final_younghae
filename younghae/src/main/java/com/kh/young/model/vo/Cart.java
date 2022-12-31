package com.kh.young.model.vo;

import java.util.ArrayList;

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
public class Cart {
	private int cartNum;
	private int userNum;
	private int proNum;
	private int cartQuantity;
	private Supplement supplement;
}
