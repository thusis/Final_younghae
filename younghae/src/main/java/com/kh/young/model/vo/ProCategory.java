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
public class ProCategory {
	private int cateNum;
	private String cateName;
	private String cateSummary;
	private String cateIcon;
	private String[] Icon;
}
