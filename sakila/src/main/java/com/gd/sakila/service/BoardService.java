package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Comment;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class BoardService {
	@Autowired
	BoardMapper boardMapper;
	@Autowired
	CommentMapper commentMapper;
	
	//게시글 수정 호출
	public int modifyBoard(Board board) {
		log.debug("▶▶▶▶▶ modifyBoard() param: "+board.toString());
		return boardMapper.updateBoard(board);
	}
	

	//게시물 삭제
	public int removeBoard(Board board) {
		log.debug("▶▶▶▶▶ removeBoard() param:"+ board.toString());		
		return boardMapper.deleteBoard(board);
	}
	
	
	//게시물 추가
	public int addBoard(Board board) {
		log.debug("▶▶▶▶▶ addBoard() param:"+ board.toString());
		return boardMapper.insertBoard(board);
	}
	//1)boardOne 상세보기 + 2)댓글목록, 수정폼
	public Map<String,Object> getBoardOne(int boardId){
		log.debug("▶▶▶▶▶▶ getBoardOne() param:"+boardId);
		//1)상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);
		
		//2)댓글 목록
		List<Comment> commentList = commentMapper.selectCommentListByBoard(boardId);
		log.debug("commentList size():"+ commentList.size());
		
		//3)리턴 값 정리
		Map<String, Object> map = new HashMap<>();
		map.put("boardMap", boardMap);
		map.put("commentList", commentList);
		
		return map;
	}
	//관리자 게시판 리스트
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord){
		//1
		int boardTotal = boardMapper.selectBoardTotal(searchWord);//searchword

		int lastPage = (int)Math.ceil((double)boardTotal / rowPerPage);
		/*
		 * int lastPage = boardTotal/rowPerPage;
		if(lastPage%rowPerPage != 0) {
			lastPage ++;
		}
		*/
		//2.
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage); // 시작페이지
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		//3.
		List<Board> boardList = boardMapper.selectBoardList(page);//page
		
		//확장성 때문에 큰 타입으로 받음...
		Map<String, Object> map = new HashMap<>();
		
		log.debug("getBoardList: "+map.toString());
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		
		return map;
	}
}
