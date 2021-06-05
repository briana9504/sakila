package com.gd.sakila.restapi;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.mapper.PaymentMapper;
import com.gd.sakila.service.CategoryService;
import com.gd.sakila.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class SalesRestapiController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	PaymentService paymentService;
	
	@GetMapping("/getSalesByDay")
	public List<Map<String, Object>> getSalesByDay(@RequestParam(value = "year", defaultValue = "2005")int year,
													@RequestParam(value = "month", defaultValue = "5")int month){
		log.debug("■■■■■■■■■■ year param: " +year);
		log.debug("■■■■■■■■■■ month param: " +month);
		
		List<Map<String, Object>> list = this.paymentService.getSalesByDay(year, month);
		log.debug("■■■■■■■■■■ list : " +list);
		
		return list;
	}
	
	@GetMapping("/getSalesByMonth")
	public List<Map<String, Object>> getSalesByMonth(@RequestParam(value = "year", defaultValue = "2005")int year){
		log.debug("■■■■■■■■■■ year param: " +year);
		
		
		return this.paymentService.getSalesByMonth(year);
	}
	
	
	@GetMapping("/getSalesByFilmCategory")
	public List<Map<String,Object>> getSalesByFilmCategory(){
		
		return this.categoryService.getSalesByFilmCategory();
	}
	
	
}
