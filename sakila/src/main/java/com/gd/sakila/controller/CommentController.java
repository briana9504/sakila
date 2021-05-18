package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CommentService;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class CommentController {
	@Autowired
	CommentService commentService;
	
	@GetMapping("/removeComment")
	public String removeComment(@RequestParam(value = "commentId", required = true)int commentId,
								@RequestParam(value = "boardId", required = true)int boardId) {
		log.debug("▶▶▶▶▶▶ removeComment comentId param: "+commentId);
		log.debug("▶▶▶▶▶▶ removeComment boardId param: "+boardId);
		
		//댓글 삭제 서비스 호출
		int row = commentService.removeCommet(commentId);
		log.debug("▶▶▶▶▶▶ removeComment row: "+row);
		
		return "redirect:/getBoardOne?boardId="+boardId;
	}
	
	@PostMapping("/addComment")
	public String addComment(Comment comment) {
		log.debug("▶▶▶▶▶▶ addComment() param: "+comment.toString());
		
		int row = commentService.addComment(comment);
		log.debug("▶▶▶▶▶▶ addComment() row: "+row);
		
		return "redirect:/getBoardOne?boardId="+comment.getBoardId();
	}
}
