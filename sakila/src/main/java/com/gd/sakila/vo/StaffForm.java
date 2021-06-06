package com.gd.sakila.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class StaffForm {
	private Staff staff;
	private Address address;
	private MultipartFile picture;
}
