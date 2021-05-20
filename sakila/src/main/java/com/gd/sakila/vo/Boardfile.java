package com.gd.sakila.vo;

import lombok.Data;
//도메인쪽... - db랑 같음...
@Data
public class Boardfile {
	private int boardfileId;
	private int boardId;
	private String boardfileName;
	private String boardfileType;
	private long boardfileSize;
}