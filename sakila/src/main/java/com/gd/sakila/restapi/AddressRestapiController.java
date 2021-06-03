package com.gd.sakila.restapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.AddressService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AddressRestapiController {
	@Autowired
	AddressService addressService;
	
	
	@GetMapping("/getPhoneByCustomer")
	public String getPhoneByCustomer(@RequestParam(value = "phone", required = true)String phone) {
		log.debug("■■■■■■■■ phone param:" + phone);
		
		
		String no = this.addressService.getPhoneByCustomer(phone);
		
		log.debug("■■■■■■■■■■■ 확인: "+no);
		return no;
	}
}
