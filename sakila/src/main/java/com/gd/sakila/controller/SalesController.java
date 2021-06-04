package com.gd.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class SalesController {
	
	@GetMapping("/getSales")
	public String getSales(Model model) {
		
		return "getSales";
	}

}
