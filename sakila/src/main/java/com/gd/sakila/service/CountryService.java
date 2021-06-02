package com.gd.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CountryMapper;
import com.gd.sakila.vo.Country;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class CountryService {
	@Autowired
	CountryMapper countryMapper;
	
	//나라 목록보기
	public List<Country> getCountryList() {
		return this.countryMapper.selectCountry();
	}
}
