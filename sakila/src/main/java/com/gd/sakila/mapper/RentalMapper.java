package com.gd.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Rental;

@Mapper
public interface RentalMapper {
	int insertRental(Rental rental);
}
