package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Page {
	private int rowPerPage;//페이지당 게시물 수
	private int beginRow;//시작 개시물
	private String searchWord;//검색어

}