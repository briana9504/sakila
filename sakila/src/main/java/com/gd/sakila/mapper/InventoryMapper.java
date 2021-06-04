package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Inventory;

@Mapper
public interface InventoryMapper {
	int deleteInventory(int inventoryId);
	int insertInventory(Inventory inventory);
	int selectInventoryTotal(String searchWord);
	List<Map<String, Object>> selectInventoryList(Map<String, Object> map);
	Map<String, Object> selectInventoryByRental(int inventoryId);
}
