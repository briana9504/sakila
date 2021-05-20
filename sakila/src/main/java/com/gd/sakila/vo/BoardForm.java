package com.gd.sakila.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardForm {
	private Board board;
	//파일을 받기 위해서 MultipartFile을 사용해야함... -> 여러개 넘기면..? -> 배열이나 List
	private List<MultipartFile> boardfile;
}