package com.gd.sakila.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.FilmService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class FilmController {
	@Autowired
	FilmService filmService;
	
	@GetMapping("/getFilmOne")
	public String getFilmOne(Model model,
								@RequestParam(value = "filmId", required = true)int filmId) {
		log.debug("§§§§§§§§§ filmId param: "+filmId);
		
		Map<String, Object> map = this.filmService.getFilmOne(filmId);
		log.debug("●＠＃＠ 확인확인: ", map);
		
		//1번 재고량
		model.addAttribute("countInvetory1",map.get("countInvetory1"));
		//2번 재고량
		model.addAttribute("countInvetory2", map.get("countInvetory2"));
		//영화정보 
		model.addAttribute("filmOne", map.get("filmOne"));
		return "getFilmOne";
	}
	
	@GetMapping("/getFilmList")
	public String getFilmList(Model model,
								@RequestParam(value = "currentPage", defaultValue = "1")int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10")int rowPerPage,
								@RequestParam(value = "searchWord", required = false)String searchWord,
								@RequestParam(value = "category", defaultValue = "all")String category,
								@RequestParam(value = "rating", defaultValue = "all")String rating,
								@RequestParam(value = "searchWordActor", required = false)String searchWordActor) {
		log.debug("§§§§§§§§§ currentPage param: "+currentPage);
		log.debug("§§§§§§§§§ rowPerPage param: "+rowPerPage);
		log.debug("§§§§§§§§§ searchWord param: "+searchWord);
		log.debug("§§§§§§§§§ category param: "+category);
		log.debug("§§§§§§§§§ rating param: "+rating);
		log.debug("§§§§§§§§§ searchWordActor param: "+searchWordActor);
		
		Map<String, Object> map =this.filmService.getFilmList(currentPage, rowPerPage, searchWord, category, rating, searchWordActor);
	
		log.debug("§§§§§§§§§ 혹안확인확인~!!!!!!!!!!!!! filmList: "+map);
		
		model.addAttribute("searchWord", searchWordActor);
		model.addAttribute("rating", rating);
		model.addAttribute("category", category);
		model.addAttribute("categoryList", map.get("categoryList"));
		model.addAttribute("filmList", map.get("filmList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		return "getFilmList";
	}
	
}
