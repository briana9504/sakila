package com.gd.sakila.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.service.BoardfileService;
import com.gd.sakila.vo.Boardfile;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class BoardfileController {
	@Autowired
	BoardfileService boardfileService;
	
	@GetMapping("/addBoardfile")
	public String addBoardfile(Model model, HttpSession session,
							@RequestParam(value = "boardId",required = true)int boardId,
							@RequestParam(value = "username", required = true)String username) {
		
		log.debug("§§§§§§§§§ get.addBoardfile() boardId param: "+boardId);
		log.debug("§§§§§§§§§ get.addBoardfile() username param: "+username);
		
		//username과 세션의 username을 검사한 후 다르면 다시 돌아감...
		Staff staff = (Staff)session.getAttribute("loginStaff");
		if(!staff.getUsername().equals(username)) {
			return"redirect:/admin/getBoardOne?boardId="+boardId;
		}
		model.addAttribute("boardId", boardId);		
		return "addBoardfile";
	}
	
	@PostMapping("/addBoardfile")
	public String addBoardfile(MultipartFile multipartFile, @RequestParam(value = "boardId", required = true)int boardId) {
		
		log.debug("§§§§§§§§§ post.addBoardfile() multipartFile param: "+multipartFile);
		log.debug("§§§§§§§§§ post.addBoardfile() boardId param: "+boardId);
		
		
		boardfileService.addBoardfile(multipartFile, boardId);
		
		return"redirect:/admin/getBoardOne?boardId="+boardId;
	}
	
	@GetMapping("/removeBoardfile")
	public String removeBoardfile(Boardfile boardfile, HttpSession session) {
		log.debug("§§§§§§§§§ removeBoardfile() param: "+boardfile);
		
		//글쓴이가 아니면 삭제 불가능하게 조정...
		Staff staff = (Staff)session.getAttribute("loginStaff");
		log.debug("§§§§§§§§§§§§§§§§§§ session staff:::: "+staff);
		//글쓴이가 아니라도 삭제 가능한 이슈....
		this.boardfileService.removeBoardfileOne(boardfile, staff);
		
		
		return"redirect:/admin/getBoardOne?boardId="+boardfile.getBoardId();
	}
}
