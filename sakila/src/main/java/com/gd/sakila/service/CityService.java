package com.gd.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CityMapper;
import com.gd.sakila.vo.City;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class CityService {
	@Autowired
	CityMapper cityMapper;
	
	public List<City> getCityList(int countryId){
		log.debug("countryId"+ countryId);
		
		return this.cityMapper.selectCity(countryId);
	}
}
