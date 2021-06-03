package com.gd.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Address;

@Mapper
public interface AddressMapper {
	int insertAddressByCustomer(Address address);
	String selectPhoneByCustomer(String phone);
}
