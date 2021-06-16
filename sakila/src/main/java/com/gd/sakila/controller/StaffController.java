package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CountryService;
import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.Country;
import com.gd.sakila.vo.StaffForm;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class StaffController {
	@Autowired
	StaffService staffService;
	@Autowired
	CountryService countryService;
	
	@PostMapping("/addStaff")
	public String addStaff(StaffForm staffForm) {
		log.debug("■■■■■■■■■■■■■■■ staffForm: "+staffForm);
		
		this.staffService.addStaff(staffForm);
		return "redirect:/admin/getStaffList";
	}
	
	@GetMapping("/addStaff")
	public String addStaff(Model model) {
		//나라별 목록
		List<Country> list =  this.countryService.getCountryList();
		log.debug("■■■■■■ countryList: "+list);
		
		model.addAttribute("countryList", list);
		
		return "addStaffTest";
	}
	
	@GetMapping("/getStaffOne")
	public String getStaffOne(Model model,
								@RequestParam(value = "ID", required = true)int ID) {
		log.debug("§§§§§§§§§§§§§§§§§§ ID: "+ ID);
		Map<String,Object> staffMap = this.staffService.getStaffOne(ID);
		log.debug("§§§§§§§§§§§§§§§§§§ staffMap: "+ staffMap);
		model.addAttribute("staffMap", staffMap);
		return "getStaffOneTest";
	}
	
	@GetMapping("/getStaffList")
	public String getStaffList(Model model) {
		List<Map<String,Object>> staffList = staffService.getStaffList();
		log.debug("§§§§§§§§§§§§§§§§§§ getStaffList: "+ staffList);
		
		model.addAttribute("staffList", staffList);
		return "getStaffListTest";
	}

}
