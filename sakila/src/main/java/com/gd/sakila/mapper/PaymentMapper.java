package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Payment;

@Mapper
public interface PaymentMapper {
	List<Map<String, Object>> selectSalesByDay(Map<String, Object> map);
	List<Map<String, Object>> selectSalesByMonth(int year);
	int insertPayment(Payment payment);
	Double selectPaymentByCustomer(int customerId);
}
