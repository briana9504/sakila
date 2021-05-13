package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService boardServcie;
	
	@GetMapping("/getBoardList")
	public String getBoardList(Model model,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
								@RequestParam(value="searchWord", required = false)String searchWord) {
		//required -> 필수 옵션  true : 꼭 받음 false: 받지 않아도됨..
		
		System.out.println(currentPage + "<--currentPage");
		System.out.println(rowPerPage + "<--rowPerPage");
		System.out.println(searchWord + "<--searchWord");
		
		Map<String, Object> map = boardServcie.getBoardList(currentPage, rowPerPage, searchWord);
		//model.addAttribute("map", map);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardList", map.get("boardList"));
		
		return "getBoardList";
	}
}
