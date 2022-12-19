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
public class Board {
	private int board_num;
	private String board_title;
	private String board_content;
	private Date board_createDate;
	private Date board_modifyDate;
	private int board_view;
	private String board_status;
	private int user_num;
	private int board_type;
}
