package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CustomerService;
import com.gd.sakila.service.RentalService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class RentalController {
	@Autowired
	RentalService rentalService;
	@Autowired
	CustomerService customerService;
	
	@GetMapping("/getRentalPopup")
	public String getRentalPopup(Model model,
								@RequestParam(value = "phone")String phone) {
		log.debug("■■■■■■■■■■ phone: "+phone);
		
		model.addAttribute("customerList", this.customerService.getCustomerListByPhone(phone));
		return "getRentalPopup";
	}
	
	//영화 미반납리스트...
	@GetMapping("/getRentalAndReturn")
	public String getRentalAndReturn(Model model,
									@RequestParam(value = "currentPage", defaultValue = "1")int currentPage,
									@RequestParam(value = "rowPerPage", defaultValue = "15")int rowPerPage) {
		
		log.debug("■■■■■■■■■■ currentPage: "+currentPage);
		log.debug("■■■■■■■■■■ rowPerPage: "+rowPerPage);
		
		Map<String, Object> map = this.rentalService.getRentalList(currentPage, rowPerPage);
		
		log.debug("■■■■■■■■■■■■■■ map: "+map);
		
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("rentalList", map.get("rentalList"));
		model.addAttribute("currentPage", currentPage);
		return "getRentalAndReturn";
	}
	
}
