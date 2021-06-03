package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.PaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class PaymentService {
	@Autowired
	PaymentMapper paymentMapper;
	
	//고객 총 구매금액
	public Double getPaymentByCustomer(int customerId) {
		log.debug("customerId: "+customerId);
		
		return this.paymentMapper.selectPaymentByCustomer(customerId);
	}
}
