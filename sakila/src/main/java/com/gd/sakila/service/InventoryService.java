package com.gd.sakila.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.InventoryMapper;
import com.gd.sakila.vo.Inventory;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class InventoryService {
	@Autowired
	InventoryMapper inventoryMapper;
	
	//인벤토리 삭제를 위한 영화 제목 검색
	public String getFilmTitleByInventoryId(int inventoryId) {
		log.debug("■■■■■■■■■■■ inventoryId param: "+inventoryId);
		
		return this.inventoryMapper.selectFilmTitleByInventoryId(inventoryId);
	}
	
	//인벤토리 삭제기능
	public void removeInventory(int inventoryId) {
		log.debug("■■■■■■■■■■■ inventoryId param: "+inventoryId);
		
		int row = this.inventoryMapper.deleteInventory(inventoryId);
		
		log.debug("■■■■■■■■■■■ 삭제 1, 실패 0: "+row);
	}
	
	//인벤토리 추가기능
	public int addInventory(Inventory inventory, int volume) {
		
		log.debug("■■■■■■■■■■■ inventory param: "+inventory);
		log.debug("■■■■■■■■■■■ volume param: "+volume);
		
		int row = 0;
		for(int i=0; i<volume; i++) {
			this.inventoryMapper.insertInventory(inventory);
			
			row += 1;
		}
		
		log.debug("추가된 재고의 갯수: "+ row);
		return row;
	}
	//인벤토리 리스트
	public Map<String, Object> getInventoryList(int currentPage, int rowPerPage, String searchWord){
		
		log.debug("■■■■■■■■■■■ currentPage param: "+currentPage);
		log.debug("■■■■■■■■■■■ rowPerPage param: "+rowPerPage);
		log.debug("■■■■■■■■■■■ SearchWord param: "+searchWord);
		
		//현재페이지 시작 행
		int beginRow = (currentPage-1)*rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		//마지막 페이지 구하기
		int totalRow = this.inventoryMapper.selectInventoryTotal(searchWord);
		int lastPage = (int)Math.ceil((double)totalRow/rowPerPage);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("inventoryList", this.inventoryMapper.selectInventoryList(paramMap));
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	
	public Map<String, Object> getInventoryByRental(int inventoryId){
		log.debug("■■■■■■■■■■ inventoryId: "+inventoryId);
		
		return this.inventoryMapper.selectInventoryByRental(inventoryId);
	}
}
