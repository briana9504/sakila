package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.service.InventoryService;
import com.gd.sakila.vo.Inventory;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class InventoryController {
	@Autowired
	InventoryService inventoService;
	@Autowired
	FilmMapper filmMapper;
	
	@PostMapping("/removeInventory")
	public String removeInventory(@RequestParam(value = "inventoryId", required = true)int inventoryId) {
		log.debug("■■■■■■■■■■■■■ inventoryId param: "+inventoryId);
		
		this.inventoService.removeInventory(inventoryId);
		
		return "redirect:/admin/getInventoryList";
	}
	
	@GetMapping("/removeInventory")
	public String removeInventory() {
		
		return "removeInventory";
	}
	
	@PostMapping("/addInventory")	
	public String addInventory(Inventory inventory,
								@RequestParam(value = "volume", required = true)int volume){
		log.debug("■■■■■■■■■■■■■ inventory param: "+inventory);
		log.debug("■■■■■■■■■■■■■ volume param: "+volume);
		
		this.inventoService.addInventory(inventory, volume);
		
		return "redirect:/admin/getInventoryList";
	}
	

	@GetMapping("/addInventory")
	public String addInventory(Model model) {//인벤토리 입력폼으로

		model.addAttribute("filmList", this.filmMapper.selectFilmListByInventory());
		return "addInventory";
	}
	
	@GetMapping("/getInventoryList")
	public String getInventoryList(Model model,
									@RequestParam(value = "currentPage", defaultValue = "1")int currentPage,
									@RequestParam(value = "rowPerPage", defaultValue = "10")int rowPerPage,
									@RequestParam(value = "searchWord", defaultValue = "")String searchWord) {
		log.debug("■■■■■■■■■■■ currentPage param: "+currentPage);
		log.debug("■■■■■■■■■■■ rowPerPage param: "+rowPerPage);
		log.debug("■■■■■■■■■■■ searchWord param: "+searchWord);
		
		Map<String, Object> map = this.inventoService.getInventoryList(currentPage, rowPerPage, searchWord);
		
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("inventoryList", map.get("inventoryList"));
		return "getInventoryList";
	}
}
