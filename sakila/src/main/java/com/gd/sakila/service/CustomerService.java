package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CustomerMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Transactional
@Service
public class CustomerService {
	@Autowired
	CustomerMapper customerMapper;
	
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
