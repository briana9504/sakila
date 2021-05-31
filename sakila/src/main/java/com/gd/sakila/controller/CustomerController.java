package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class CustomerController {
	@Autowired
	CustomerService customerService;
	
	@GetMapping("/getCustomerList")
	public String getCustomerList(Model model,
									@RequestParam(value = "currentPage", defaultValue = "1")int currentPage,
									@RequestParam(value= "rowPerPage", defaultValue = "10")int rowPerPage,
									@RequestParam(value= "searchName", defaultValue = "")String searchName,
									@RequestParam(value = "searchPhone", defaultValue = "")String searchPhone,
									@RequestParam(value = "storeId", defaultValue = "")String storeId) {
		log.debug("■■■■■■■■■■■■ currentPage param: "+ currentPage);
		log.debug("■■■■■■■■■■■■ rowPerPage param: "+ rowPerPage);
		log.debug("■■■■■■■■■■■■ SearchWord param: "+ searchName);
		log.debug("■■■■■■■■■■■■ SearchWord param: "+ searchPhone);
		log.debug("■■■■■■■■■■■■ storeId param: "+ storeId);
		
		Map<String, Object> map = this.customerService.getCustomerList(currentPage, rowPerPage, searchName, searchPhone, storeId);
		
		log.debug("■■■■■■■■■■■■ map: "+ map);
		
		model.addAttribute("customerList", map.get("customerList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchName", searchName);
		model.addAttribute("searchPhone", searchPhone);
		model.addAttribute("storeId", storeId);
		return "getCustomerList";
	}
}
