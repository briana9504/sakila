package com.gd.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Payment;

@Mapper
public interface PaymentMapper {
	int insertPayment(Payment payment);
	Double selectPaymentByCustomer(int customerId);
}
