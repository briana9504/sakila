package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class InventoryController {
	@Autowired
	InventoryService inventoService;
	
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
