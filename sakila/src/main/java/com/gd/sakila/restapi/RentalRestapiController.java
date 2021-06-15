package com.gd.sakila.restapi;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.CustomerService;
import com.gd.sakila.service.RentalService;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class RentalRestapiController {
	
	@Autowired
	RentalService RentalService;
	@Autowired
	CustomerService customerService;
	
	//반납
	@GetMapping("/modifyRentalAndPaymentForReturn")
	public int modifyRentalAndPaymentForReturn(@RequestParam(value = "rentalId")int rentalId,
										@RequestParam(value = "amount")Double amount) {
		
		log.debug("■■■■■■■■■■■■■ rentalId: " + rentalId);
		log.debug("■■■■■■■■■■■■■ amount: " + amount);
		
		return this.RentalService.modifyRentalAndPaymentForReturn(amount, rentalId);
	}
	
	//반납을 위한 인벤토리 검색
	@GetMapping("/getRentalListByInventoryId")
	public List<Map<String, Object>> getRentalListBy(@RequestParam(value = "inventoryId", required = true)int inventoryId){
		log.debug("■■■■■■■■■■■■■ inventoryId: " + inventoryId);
		
		return this.RentalService.getRentalListByInventoryId(inventoryId);
	}
	
	//대여를 위한 손님 검색
	@GetMapping("/getCustomerListByPhone")
	public List<Map<String, Object>> getCustomerListByPhone(@RequestParam(value = "phone", required = true)String phone){
		log.debug("■■■■■■■■■■ phone param: "+phone);
		
		return this.customerService.getCustomerListByPhone(phone);
	}
	
	@GetMapping("/addRental")
	public void addRental(HttpSession session,
							@RequestParam(value = "customerId", required = true)int customerId,
							@RequestParam(value = "inventoryId", required = true)int inventoryId,
							@RequestParam(value = "rentalRate", required = true)double rentalRate) {
		Staff staff = (Staff)session.getAttribute("loginStaff");
		
		log.debug("■■■■■■■■■■ staff param: "+staff);
		log.debug("■■■■■■■■■■ customerId param: "+customerId);
		log.debug("■■■■■■■■■■ inventoryId param: "+inventoryId);
		log.debug("■■■■■■■■■■ rentalRate param: "+rentalRate);
		
		this.RentalService.addRental(staff.getStaffId(), customerId, rentalRate, inventoryId);

	}
}
