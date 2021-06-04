package com.gd.sakila.restapi;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.CategoryService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class SalesRestapiController {
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/getSalesByFilmCategory")
	public List<Map<String,Object>> getSalesByFilmCategory(){
		
		return this.categoryService.getSalesByFilmCategory();
	}
	
	
}
