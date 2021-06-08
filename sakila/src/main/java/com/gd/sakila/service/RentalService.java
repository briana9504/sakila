package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.PaymentMapper;
import com.gd.sakila.mapper.RentalMapper;
import com.gd.sakila.vo.Payment;
import com.gd.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
@Slf4j
public class RentalService {
	@Autowired
	RentalMapper rentalMapper;
	@Autowired
	PaymentMapper paymentMapper;
	
	
	//대여중인 목록
	public Map<String,Object> getRentalList(int currentPage, int rowPerPage) {
		
		int beginRow = (currentPage-1)*rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		log.debug("■■■■■■■■■■■■■■■ 확인확인: "+paramMap);
		
		int lastPage = (int)Math.ceil((double)this.rentalMapper.selectRentalListTotal()/rowPerPage);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("lastPage", lastPage);
		returnMap.put("rentalList", this.rentalMapper.selectRentalList(paramMap));
		
		return returnMap;
	}
	
	public void addRental(int staffId, int customerId, double rentalRate, int inventoryId) {
		
		Rental rental = new Rental();
		rental.setCustomerId(customerId);
		rental.setInventoryId(inventoryId);
		rental.setStaffId(staffId);
		
		this.rentalMapper.insertRental(rental);
		
		log.debug("■■■■■■■■■■■■■■ rental: "+rental);
		
		Payment payment = new Payment();
		payment.setAmount(rentalRate);
		payment.setCustomerId(customerId);
		payment.setRentalId(rental.getRentalId());
		payment.setStaffId(staffId);
		
		log.debug("■■■■■■■■■■■■■■ payment: "+payment);
		
		this.paymentMapper.insertPayment(payment);
		
	}
}
