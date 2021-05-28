package com.gd.sakila.controller;


import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.mapper.LanguageMapper;
import com.gd.sakila.service.CategoryService;
import com.gd.sakila.service.FilmService;
import com.gd.sakila.service.LanguageService;
import com.gd.sakila.vo.Category;
import com.gd.sakila.vo.FilmForm;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class FilmController {
	@Autowired
	FilmService filmService;
	@Autowired
	CategoryService categoryServce;
	@Autowired
	LanguageService languageService;
	
	@GetMapping("/addFilm")//영화 추가 폼으로 연결 ->필요한 것 categoryList, languageList
	public String addFilm(Model model) {
		
		model.addAttribute("categoryList", this.categoryServce.getCategoryList());
		model.addAttribute("languageList", this.languageService.getLanguageList());
		return "addFilm";
	}
	
	@PostMapping("/addFilm") //영화 추가 form 에서 받음
	public String addFilm(FilmForm filmForm) {
		log.debug("■■■■■■■■■■■■■■■■ filmForm param:"+filmForm);
		int filmId = this.filmService.addFilm(filmForm);
		return "redirect:/admin/getFilmOne?filmId="+ filmId;
	}
	
	@PostMapping("/modifyFilmActor") //영화 출연 배우 수정
	public String modifyFilmActor(@RequestParam(value = "actorId", required = false)List<Integer> actorId,
								@RequestParam(value = "filmId", required = true)int filmId) {
		log.debug("■■■■■■■■ actorId param: "+actorId);
		log.debug("■■■■■■■■ filmId param: "+filmId);
		
		int row = this.filmService.modifyFilmActor(actorId, filmId);
		log.debug("■■■■■■■■■■■■ 컨트롤러 확인: "+row);
		
		return "redirect:/admin/getFilmOne?filmId="+filmId;
	}
	
	//영화 배우추가 form으로
	@GetMapping("/getFilmActorListByFilm")
	public String getFilmActorListByFilm(Model model, @RequestParam(value = "filmId", required = true)int filmId) {
		log.debug("■■■■■■■■■■ filmId param: "+filmId);
		
		List<Map<String, Object>> list = this.filmService.getFilmActorListByFilm(filmId);
		log.debug("■■■■■■■■■■ list size(): "+ list.size());
		
		model.addAttribute("actorList", list);
		model.addAttribute("filmId", filmId);
		return "getFilmActorListByFilm";
	}
	
	//영화 상세보기
	@GetMapping("/getFilmOne")
	public String getFilmOne(Model model,
								@RequestParam(value = "filmId", required = true)int filmId) {
		log.debug("§§§§§§§§§ filmId param: "+filmId);
		
		Map<String, Object> map = this.filmService.getFilmOne(filmId);
		log.debug("●＠＃＠ 영화 상세보기 filmOne 확인확인: ", map);
		
		Map<String, Object> filmOne = (Map<String,Object>)map.get("filmOne");

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
		model.addAttribute("categoryList", this.categoryServce.getCategoryList());
		model.addAttribute("filmList", map.get("filmList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		return "getFilmList";
	}
	
}
