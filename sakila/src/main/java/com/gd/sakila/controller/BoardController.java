package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.BoardService;
import com.gd.sakila.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	@Autowired
	BoardService boardServcie;
	
	//C -> M -> redirect
	@PostMapping("/removeBoard")
	public String removeBoard(Board board) {
		
		int row = boardServcie.removeBoard(board);
		log.debug("param: "+row);
		if(row == 0) {//실패
			return "redirect:/getBoardOne?boardId="+board.getBoardId();
		}
		return"redirect:/getBoardList";
	}
	
	//게시물 삭제 c-> v
	@GetMapping("/removeBoard")
	public String removeBoard(Model model, @RequestParam(value = "boardId", required = true)int boardId) {
		log.debug("param: "+boardId);
		model.addAttribute("boardId", boardId);
		return"removeBoard";//리턴타입 뷰이름 -> 문자열
	}
	
	@GetMapping("/addBoard")
	public String addBoard() {
		return"addBoard";
	}
	
	@PostMapping("/addBoard")//request 값들을 spring 받아서 묶어줌(커맨드객체): input type의 명의 board의 필드 명과 같아야함...
	public String addBoard(Board board) {
		boardServcie.addBoard(board);
		return "redirect:/getBoardList"; //forward가 아닌 redirect
		//context명이 있음 redirect:/이름/getBoardList
	}
	//관리자 게시판 상세보기
	@GetMapping("/getBoardOne")
	public String getBoardOne(Model model, @RequestParam(value="boardId", required = true)int boardId) {
		log.debug("▶▶▶▶▶boardOne : "+boardServcie.getBoardOne(boardId).toString());
		//model servlet의 request.getattribute와 비슷한 역할
		model.addAttribute("map", boardServcie.getBoardOne(boardId));
		return "getBoardOne";
	}
	
	//관리자 게시판
	@GetMapping("/getBoardList")
	public String getBoardList(Model model,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
								@RequestParam(value="searchWord", required = false)String searchWord) {
		//required -> 필수 옵션  true : 꼭 받음 false: 받지 않아도됨..
		log.debug("currentPage: "+ currentPage);
		log.debug("rowPerPage: "+ rowPerPage);
		log.debug("searchWord: "+ searchWord);
		
		Map<String, Object> map = boardServcie.getBoardList(currentPage, rowPerPage, searchWord);
		//model.addAttribute("map", map);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardList", map.get("boardList"));
		
		return "getBoardList";
	}
}
