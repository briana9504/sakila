package com.gd.sakila.controller;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.BoardService;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.BoardForm;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")//get과 post요청 둘다 받음--> 클래스 위에 맵핑이 되면 밑의 매핑과 함쳐져서 처리됨
public class BoardController {
	@Autowired
	BoardService boardServcie;
	//게시물 수정
	@GetMapping("/modifyBoard")
	public String modifyBoard(Model model, @RequestParam(value = "boardId", required = true)int boardId) {
		log.debug("▶▶▶▶▶ modifyBoard() param: "+boardId);
		
		Map<String, Object> map = boardServcie.getBoardOne(boardId);
		log.debug("▶▶▶▶▶ modifyBoard() map: "+map.get("boardMap"));
		model.addAttribute("map", map.get("boardMap"));
		return"modifyBoardTest";
	}
	
	@PostMapping("/modifyBoard")
	public String modifyBoard(Board board) {
		log.debug("▶▶▶▶▶ modifyBoard() param: " +board.toString());
		int row = boardServcie.modifyBoard(board);
		log.debug("▶▶▶▶▶ update row:"+ row);
		return"redirect:/admin/getBoardOne?boardId="+board.getBoardId();
	}
	
	//C -> M -> redirect
	@PostMapping("/removeBoard")
	public String removeBoard(Board board) {
		
		int row = boardServcie.removeBoard(board);
		log.debug("▶▶▶▶▶ removeBoard() param: "+row);
		if(row == 0) {//실패
			return "redirect:/getBoardOne?boardId="+board.getBoardId();
		}
		return"redirect:/admin/getBoardList";
	}
	
	//게시물 삭제 c-> v
	@GetMapping("/removeBoard")
	public String removeBoard(Model model, @RequestParam(value = "boardId", required = true)int boardId) {
		log.debug("▶▶▶▶▶ param: "+boardId);
		model.addAttribute("boardId", boardId);
		return"removeBoardTest";//리턴타입 뷰이름 -> 문자열
	}
	
	//게시물 입력창
	@GetMapping("/addBoard")
	public String addBoard() {
		return"addBoardTest";
	}
	
	//게시물 입력 후 올리기
	@PostMapping("/addBoard")//request 값들을 spring 받아서 묶어줌(커맨드객체): input type의 명의 board의 필드 명과 같아야함...
	public String addBoard(BoardForm boardForm) {
		log.debug("▶▶▶▶▶ 확인확인  addBoard boardForm: "+boardForm);
		boardServcie.addBoard(boardForm);
		return "redirect:/admin/getBoardList"; //forward가 아닌 redirect
		//context명이 있음 redirect:/이름/getBoardList
	}
	
	//관리자 게시판 상세보기 //1)첨부파일 2)날짜 3)content title 등이 들어간 map 4)댓글 리스트
	@GetMapping("/getBoardOne")
	public String getBoardOne(Model model, @RequestParam(value="boardId", required = true)int boardId, HttpSession session) {
		
		Staff staff = (Staff)session.getAttribute("loginStaff");
		log.debug("§§§§§§ session staff: "+staff);
		//model servlet의 request.getattribute와 비슷한 역할
		Map<String, Object> map = boardServcie.getBoardOne(boardId);
		
		log.debug("▶▶▶▶▶map : "+map);
		
		//날짜 형식 변환 --map에 insertDate가 timeStamp로 들어가 있음..
		Map<String, Object> boardMap = (Map<String, Object>) map.get("boardMap");
		String insertDate = new SimpleDateFormat("yyyy-MM-dd").format(boardMap.get("insertDate"));
		log.debug("▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ date::: "+ insertDate);
		
		model.addAttribute("sessionUsername", staff.getUsername());
		model.addAttribute("boardfileList", map.get("boardfileList"));
		model.addAttribute("insertDate", insertDate);
		model.addAttribute("boardMap",map.get("boardMap"));
		model.addAttribute("commentList", map.get("commentList"));
		return "getBoardOneTest";
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
		
		return "getBoardListTest";
	}
}
