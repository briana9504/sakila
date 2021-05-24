package com.gd.sakila.service;

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
	
	public void modifyCustomerActiveByScheduler() {
		log.debug("§§§§§§§§ modifyCustomerActiveByScheduler() 실행");
		int row = this.customerMapper.updateCustomerActiveByscheduler();
		log.debug("§§§§§§§§ 휴먼고객 처리 행수: "+row);
	}
}
