package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.sakila.service.RentalService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class RentalController {
	@Autowired
	RentalService rentalService;
	
	@GetMapping("/getRentalList")
	public String getRentalList(Model model) {
		
		model.addAttribute("", this.rentalService.getRentalList(null));
		return "getOverdueList";
	}
}
