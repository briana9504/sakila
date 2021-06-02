package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerMapper {
	List<Map<String, Object>> selectRentalListByCustomer(int customerId);
	Map<String, Object> selectCustomerOne(int customerId);
	int updateCustomerActiveByscheduler();
	List<Map<String, Object>> selectCustomerList(Map<String, Object> map);
	int selectCustomerTotal(Map<String, Object> map);
}
