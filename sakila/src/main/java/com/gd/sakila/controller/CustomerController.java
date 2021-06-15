package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CountryService;
import com.gd.sakila.service.CustomerService;
import com.gd.sakila.service.PaymentService;
import com.gd.sakila.vo.Country;
import com.gd.sakila.vo.CustomerForm;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class CustomerController {
	@Autowired
	CustomerService customerService;
	@Autowired
	PaymentService paymentService;
	@Autowired
	CountryService countryService;
	
	
	@PostMapping("/addCustomer")
	public String addCustomer(CustomerForm customerForm) {
		log.debug("■■■■■■■■■■■■■■ customerForm param: " + customerForm);
		
		int customerId = this.customerService.addCustomer(customerForm);
		return "redirect:/admin/getCustomerOne?customerId=" + customerId;
	}
	
	@GetMapping("/addCustomer")
	public String addCustomer(Model model) {
		
		//나라별 목록
		List<Country> list =  this.countryService.getCountryList();
		log.debug("■■■■■■ countryList: "+list);
		
		model.addAttribute("countryList", list);
		return "addCustomer";
	}
	
	@GetMapping("/getCustomerOne")
	public String getCustomerOne(Model model, @RequestParam(value = "customerId", required = true)int customerId) {
		log.debug("■■■■■■■■■■■■■■■■■■ customerId: "+customerId);
		
		Map<String, Object> map = this.customerService.getCustomerOne(customerId);
		log.debug("■■■■■■■■■■■ map: " + map);
		
		//총 구매금액
		Double totalPayment = this.paymentService.getPaymentByCustomer(customerId);
		log.debug("totalPayment" + totalPayment);
		
		model.addAttribute("customerOne" , map.get("customerOne"));
		model.addAttribute("rentalList", map.get("rentalList"));
		model.addAttribute("totalPayment", totalPayment);
		return "getCustomerOne";
	}
	
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
		return "getCustomerListTest";
	}
}
