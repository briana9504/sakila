package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Page;

@Service
public class BoardService {
	@Autowired
	BoardMapper boardMapper;
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
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		
		return map;
	}
}
