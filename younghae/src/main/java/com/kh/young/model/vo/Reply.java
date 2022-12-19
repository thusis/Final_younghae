package com.kh.young.model.vo;

import java.sql.Date;

import lombok.Data;

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
public class Reply {
	private int reply_num;
	private String reply_content;
	private Date reply_date;
	private String reply_status;
	private int board_type;
	private int board_num;
	private int user_num;
}
