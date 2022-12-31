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
public class ExpertUser {
	private int userNum;
	private String expertPostAdd;
	private String expertAddress;
	private String expertAddDetail;
	private String expertSort;
	private String expertMedi;
	private String expertDept;
	private String expertProfile;
	private String expertHomepage;
	private String expertCareer;
	private String expertEstimate;
	private String expertLatitude;
	private String expertLongtitude;
}
