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
public class EventAttendance {
	private int att_no;
	private Date att_date;
	private int user_num;
	private int event_num;
}
