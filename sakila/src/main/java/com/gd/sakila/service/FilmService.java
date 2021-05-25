package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.mapper.FilmMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class FilmService {
	@Autowired
	CategoryMapper categoryMapper;
	@Autowired
	FilmMapper filMapper;
	
	//film 상세보기 : count 재고량 확인할것임..
	public Map<String, Object> getFilmOne(int filmId){
		log.debug("＆＆＆＆＆＆＆＆＆＆＆＆ filmId"+filmId);
		
		//1번 store 재고량 구하기
		Map<String, Object> paramMap1 = new HashMap<String, Object>();
		paramMap1.put("filmId", filmId);
		paramMap1.put("storeId", 1);
		int filmCount1 = 0; //out용
		paramMap1.put("filmCount", filmCount1);
		
		List<Integer> list = this.filMapper.selectFilmInStock(paramMap1);
		
		//2번 store 재고량 구하기
		Map<String, Object> paramMap2 = new HashMap<String, Object>();
		paramMap2.put("filmId", filmId);
		paramMap2.put("storeId", 2);
		int filmCount2 = 0; //out용
		paramMap2.put("filmCount", filmCount2);
			
		this.filMapper.selectFilmInStock(paramMap2);
		
		log.debug("§§§§§§§§§§§ filmCount1: " + paramMap1.get("filmCount"));
		log.debug("§§§§§§§§§§§ filmCount2: " + paramMap2.get("filmCount"));
		log.debug("§§§§§§§§§§§ row: " + list);
		
		Map<String, Object> returnMap = new HashMap<>();
		//1번 스토어 재고량
		returnMap.put("countInvetory1", paramMap1.get("filmCount"));
		//2번 스토어 재고량
		returnMap.put("countInvetory2", paramMap2.get("filmCount"));
		
		//영화 정보
		returnMap.put("filmOne", this.filMapper.selectFilmOne(filmId));
		
		return returnMap;
	}
	//film list
	public Map<String, Object> getFilmList(int currentPage, int rowPerPage, String searchWord, String category, String rating, String searchActor, Double price){
		log.debug("§§§§§§§ getFlimList currentPage param: "+currentPage);
		log.debug("§§§§§§§ getFlimList rowPerPage param: "+rowPerPage);
		log.debug("§§§§§§§ getFlimList SearchWord param: "+searchWord);
		log.debug("§§§§§§§ getFlimList category param: "+category);
		log.debug("§§§§§§§ getFlimList rating param: "+rating);
		log.debug("§§§§§§§ getFlimList searchActor param: "+searchActor);
		log.debug("§§§§§§§ getFlimList price param: "+price);
		
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = (currentPage-1)*rowPerPage;
		
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		paramMap.put("beginRow", beginRow);
		paramMap.put("category", category);
		paramMap.put("rating", rating);
		paramMap.put("searchActor", searchActor);
		paramMap.put("price", price);
		
		
		log.debug("§§§§§§§§ paramMap: "+paramMap);
		
		//카테고리 리스트
		List<String> categoryList = this.categoryMapper.selectCategoryList();
		log.debug("§§§§§§§§§§ categoryList: "+categoryList);
		
		//총 페이지 수..에서 lastPage구하기
		int totalPage = this.filMapper.selectFilmTotal(paramMap);
		
		int lastPage = (int)Math.ceil((double)totalPage/rowPerPage);
		
		Map<String, Object> map = new HashMap<>();

		map.put("categoryList", categoryList);
		map.put("filmList", this.filMapper.selectFilmList(paramMap));
		map.put("lastPage", lastPage);
		return map;
	}
}
