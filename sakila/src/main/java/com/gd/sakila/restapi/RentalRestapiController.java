package com.gd.sakila.restapi;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.RentalService;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class RentalRestapiController {
	
	@Autowired
	RentalService RentalService;
	
	@GetMapping("/addRental")
	public void addRental(HttpSession session,
							@RequestParam(value = "customerId", required = true)int customerId,
							@RequestParam(value = "inventoryId", required = true)int inventoryId,
							@RequestParam(value = "rentalRate", required = true)double rentalRate) {
		Staff staff = (Staff)session.getAttribute("loginStaff");
		
		log.debug("■■■■■■■■■■ staff param: "+staff);
		log.debug("■■■■■■■■■■ inventoryId param: "+customerId);
		log.debug("■■■■■■■■■■ inventoryId param: "+inventoryId);
		log.debug("■■■■■■■■■■ inventoryId param: "+rentalRate);
		
		this.RentalService.addRental(staff.getStaffId(), customerId, rentalRate, inventoryId);

	}
}
