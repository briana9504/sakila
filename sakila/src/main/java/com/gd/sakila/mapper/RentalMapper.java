package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Rental;

@Mapper
public interface RentalMapper {
	int updateRentalForReturn(int rentalId);
	List<Map<String, Object>> selectRentalListByInventoryId(int inventoryId);
	int selectRentalListTotal();
	List<Map<String, Object>> selectRentalList(Map<String, Object> map);//미반납 영화목록
	int insertRental(Rental rental);
}
