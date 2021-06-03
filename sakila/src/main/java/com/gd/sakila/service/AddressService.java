package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.AddressMapper;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
@Slf4j
public class AddressService {
	@Autowired
	AddressMapper addressMapper;
	
	public String getPhoneByCustomer(String phone) {
		log.debug("■■■■■■■■ phone param: " +phone);
		
		String no = this.addressMapper.selectPhoneByCustomer(phone);
		log.debug("■■■■■■■■ no: " +no);
		

		return no;
	}
}
