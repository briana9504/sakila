package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//일별 매출액
	public List<Map<String, Object>> getSalesByDay(int year, int month){
		log.debug("■■■■■■■■ month param: "+month);
		log.debug("■■■■■■■■ year param: "+year);
		
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		
		return this.paymentMapper.selectSalesByDay(map);
	}
	//월별 매출액
	public List<Map<String, Object>> getSalesByMonth(int year){
		log.debug("■■■■■■■■ year param: "+year);
		return this.paymentMapper.selectSalesByMonth(year);
	}
	//고객 총 구매금액
	public Double getPaymentByCustomer(int customerId) {
		log.debug("customerId: "+customerId);
		
		return this.paymentMapper.selectPaymentByCustomer(customerId);
	}
}
