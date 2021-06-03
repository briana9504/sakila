package com.gd.sakila.service;

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
