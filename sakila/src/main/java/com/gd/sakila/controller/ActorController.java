package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.ActorService;
import com.gd.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class ActorController {
	@Autowired
	ActorService actorService;
	
	@GetMapping("/addActor")
	public String addActor() {
		return "addActorTest";
	}
	
	@PostMapping("/addActor")
	public String addActor(Actor actor) {
		log.debug("■■■■■■■■■■ actor param: " + actor);
		
		int row = this.actorService.addActor(actor);
		log.debug("■■■■■■■■■■ row: " + row);
		return "redirect:/admin/getActorList";
	}
	
	//배우 리스트 -> 배우 프로필이 너무 두서없는 이슈...
	@GetMapping("/getActorList")
	public String getActorList(Model model,
								@RequestParam(value = "currentPage", defaultValue = "1")int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10")int rowPerPage,
								@RequestParam(value = "searchWord", defaultValue = "")String searchWord,
								@RequestParam(value = "searchFilm", defaultValue = "")String searchFilm) {
		
		log.debug("■■■■■■■■■■ currentPage param: " + currentPage);
		log.debug("■■■■■■■■■■ rowPerPage param: " + rowPerPage);
		log.debug("■■■■■■■■■■ searchWord param: " + searchWord);
		log.debug("■■■■■■■■■■ searchFilm param: " + searchFilm);
		
		Map<String, Object> map = this.actorService.getActorInfoList(currentPage, rowPerPage, searchWord, searchFilm);
		log.debug("■■■■■■■■■■ map: " + map);
		
		model.addAttribute("searchFilm", searchFilm);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("actorList", map.get("actorList"));
		return "getActorListTest";
	}
}
