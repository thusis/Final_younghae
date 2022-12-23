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
public class Attachment {
	private int attachNum;
	private Date attachUploadDate;
	private String attachName;
	private String attachRename;
	private String attachPath;
	private int boardType;
	private int serialNumber;
	private String attachStatus;
}
