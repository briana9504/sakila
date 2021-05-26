package com.gd.sakila.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	//영화 상세보기
	@GetMapping("/getFilmOne")
	public String getFilmOne(Model model,
								@RequestParam(value = "filmId", required = true)int filmId) {
		log.debug("§§§§§§§§§ filmId param: "+filmId);
		
		Map<String, Object> map = this.filmService.getFilmOne(filmId);
		log.debug("●＠＃＠ 영화 상세보기 filmOne 확인확인: ", map);
		
		//Map으로 받으니까 releasYear가 2006-01-01로 표기되는 이슈 -> Date를 포멧해준다.
		Map<String, Object> filmOne = (Map<String,Object>)map.get("filmOne");
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy");
		String releaseYear = dtFormat.format(filmOne.get("releaseYear"));
		
		log.debug("■■■■■■■■■■■ 개봉년도(releaseYear) :"+releaseYear);
		
		//releaseYear
		model.addAttribute("releaseYear", releaseYear);
		//1번 재고량
		model.addAttribute("countInvetory1",map.get("countInvetory1"));
		//2번 재고량
		model.addAttribute("countInvetory2", map.get("countInvetory2"));
		//영화정보 
		model.addAttribute("filmOne", filmOne);
		return "getFilmOne";
	}
	
	//영화 리스트
	@GetMapping("/getFilmList")
	public String getFilmList(Model model,
								@RequestParam(value = "currentPage", defaultValue = "1")int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10")int rowPerPage,
								@RequestParam(value = "searchWord", defaultValue = "")String searchWord,
								@RequestParam(value = "category", defaultValue = "all")String category,
								@RequestParam(value = "rating", defaultValue = "all")String rating,
								@RequestParam(value = "searchActor", defaultValue = "")String searchActor,
								@RequestParam(value = "price", required = false)Double price,
								@RequestParam(value = "searchDescription", defaultValue = "")String searchDescription,
								@RequestParam(value = "titleAndDescription", defaultValue = "")String titleAndDescription) {
		//현재 페이지
		log.debug("§§§§§§§§§ currentPage param: "+currentPage);
		//페이지당 게시물 수
		log.debug("§§§§§§§§§ rowPerPage param: "+rowPerPage);
		//제목 검색
		log.debug("§§§§§§§§§ searchWord param: "+searchWord);
		//카테고리
		log.debug("§§§§§§§§§ category param: "+category);
		//영화 등급
		log.debug("§§§§§§§§§ rating param: "+rating);
		//배우 검색
		log.debug("§§§§§§§§§ searchActor param: "+searchActor);
		//가격
		log.debug("§§§§§§§§§ price param: "+price);
		//줄거리
		log.debug("§§§§§§§§§ searchDescription param: "+searchDescription);
		//줄거리 + 제목
		log.debug("§§§§§§§§§ titleAndDescription param: "+titleAndDescription);
				
		if(price != null && price == 0) {
			price = null;
		}
		//service 호출
		Map<String, Object> map =this.filmService.getFilmList(currentPage, rowPerPage, searchWord, category, rating, searchActor, price, searchDescription, titleAndDescription);
	
		log.debug("§§§§§§§§§ filmList: "+map);
		
			
		model.addAttribute("titleAndDescription",titleAndDescription);
		model.addAttribute("searchDescription",searchDescription);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("price", price);
		model.addAttribute("searchActor", searchActor);
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
