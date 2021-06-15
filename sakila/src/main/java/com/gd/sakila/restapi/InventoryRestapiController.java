package com.gd.sakila.restapi;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class InventoryRestapiController {
	@Autowired
	InventoryService inventoryService;
	
	@GetMapping("/getFilmTitleByInventoryId")
	public String getFilmTitleByInventoryId(@RequestParam(value = "inventoryId", required = true)int inventoryId) {
		
		log.debug("■■■■■■■■■■■ inventoryId param: " + inventoryId);
		
		
		return this.inventoryService.getFilmTitleByInventoryId(inventoryId);
	}
	
	@GetMapping("/getInventoryByRental")
	public Map<String, Object> getInventoryByRental(@RequestParam(value = "inventoryId", required = true)int inventoryId){
		
		log.debug("■■■■■■■■■■■ inventoryId param: " + inventoryId);
		
		Map<String, Object> map = this.inventoryService.getInventoryByRental(inventoryId);
		log.debug("■■■■■■■■■■■■■ inventory map : "+map);
		
		return map;
	}
}
