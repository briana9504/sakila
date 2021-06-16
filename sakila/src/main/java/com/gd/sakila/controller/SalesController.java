package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.sakila.service.FilmService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class SalesController {
	@Autowired
	FilmService filmService;
	@GetMapping("/getSales")
	public String getSales(Model model) {
		model.addAttribute("bestSaller", this.filmService.getBestSellers());
		return "getSalesTest";
	}

}
