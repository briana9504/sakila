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
	
	//반납 -> payment amount추가 , rental에 return_date 추가
	public int modifyRentalAndPaymentForReturn(Double amount, int rentalId) {
		log.debug("■■■■■■■■■■■ amount : " + amount);
		log.debug("■■■■■■■■■■■ rentalId : " + rentalId);
		
		Payment payment = new Payment();
		payment.setAmount(amount);
		payment.setRentalId(rentalId);
		
		//rental 리스트 returndate 추가
		int row = this.rentalMapper.updateRentalForReturn(rentalId);
		
		//payemnt에 amount 업데이트
		int no = this.paymentMapper.updatePaymentForReturn(payment);
		
		return row+no;
	}
	
	//반납을 위한 목록
	public List<Map<String, Object>> getRentalListByInventoryId(int inventoryId){
		log.debug("■■■■■■■■■■■ inventoryId : " + inventoryId);
		
		return this.rentalMapper.selectRentalListByInventoryId(inventoryId);
	}
	
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
