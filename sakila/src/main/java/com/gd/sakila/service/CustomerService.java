package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.AddressMapper;
import com.gd.sakila.mapper.CustomerMapper;
import com.gd.sakila.vo.Address;
import com.gd.sakila.vo.Customer;
import com.gd.sakila.vo.CustomerForm;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Transactional
@Service
public class CustomerService {
	@Autowired
	CustomerMapper customerMapper;
	@Autowired
	AddressMapper addressMapper;
	
	//대여를 위한 손님목록 가져오기
	public List<Map<String, Object>> getCustomerListByPhone(String phone){
		log.debug("■■■■■■■■■■■■■■ phone : "+phone);
		
		return this.customerMapper.selectCustomerListByPhone(phone);
	}

	//손님 등록하기 + address 등록
	public int addCustomer(CustomerForm customerForm) {
		log.debug("■■■■■■■■■■■■ customerFrom: "+customerForm);
		
		Address address = customerForm.getAddress();
		Customer customer = customerForm.getCustomer();
		//주소를 등록하고 addressId를 받음
		this.addressMapper.insertAddress(address);
		
		//받은 addressId를 customer에 넣어줌
		customer.setAddressId(address.getAddressId());
		
		int row = this.customerMapper.insertCustomer(customer);
		log.debug("■■■■■■■■■■■■■ 성공1, 실패0: " +row);
		
		return customer.getCustomerId();
	}
	//고객 상세보기+고객 대여목록 보기
	public Map<String, Object> getCustomerOne(int customerId){
		log.debug("■■■■■■■■■■■■■ customerId: " + customerId);
		
		Map<String, Object> map = new HashMap<>();
		//customerOne
		map.put("customerOne", this.customerMapper.selectCustomerOne(customerId));
		//고객 대여 목록보기
		map.put("rentalList", this.customerMapper.selectRentalListByCustomer(customerId));
		
		log.debug("■■■■■■■■■■■■■■■■ map: "+ map);
		return map;
	}
	
	public Map<String, Object> getCustomerList(int currentPage, int rowPerPage, String searchName, String searchPhone, String storeId) {
		log.debug("■■■■■■■■■■■ currentPage param: "+ currentPage);
		log.debug("■■■■■■■■■■■ rowPerPage param: "+ rowPerPage);
		log.debug("■■■■■■■■■■■ SearchName param: "+ searchName);
		log.debug("■■■■■■■■■■■ searchPhone param: "+ searchPhone);
		log.debug("■■■■■■■■■■■ storeId param: "+ storeId);
		
		//시작 행
		int beginRow = (currentPage-1)*rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("searchName", searchName);
		paramMap.put("searchPhone", searchPhone);
		paramMap.put("storeId", storeId);
		
		
		log.debug("■■■■■■■■■■■ paramMap: "+ paramMap);
		
		//전체 행의 수
		int total= this.customerMapper.selectCustomerTotal(paramMap);
		
		//마지막 페이지
		int lastPage = (int)Math.ceil((double)total/rowPerPage);
		
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("beginRow", beginRow);
		
		List<Map<String, Object>> customerList = this.customerMapper.selectCustomerList(paramMap);
		
		
		Map<String, Object> returnMap = new HashMap<>();
		
		returnMap.put("lastPage", lastPage);
		returnMap.put("customerList", customerList);
		
		return returnMap;
	}
	
	public void modifyCustomerActiveByScheduler() {
		log.debug("§§§§§§§§ modifyCustomerActiveByScheduler() 실행");
		int row = this.customerMapper.updateCustomerActiveByscheduler();
		log.debug("§§§§§§§§ 휴먼고객 처리 행수: "+row);
	}
}
