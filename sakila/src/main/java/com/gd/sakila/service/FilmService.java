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
	
	//영하 추가 배우목록 보기!
	public List<Map<String, Object>> getActorListForAddFilmActor(int filmId){
		log.debug("■■■■■■■■■■■■■■■■ filmId param: "+filmId);
		return this.filMapper.selectActorForFilmActorInsert(filmId);
	}
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
		
		//controller로 보낼 값 map에 넣기
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
	public Map<String, Object> getFilmList(int currentPage, int rowPerPage, String searchWord, String category, String rating, String searchActor, Double price, String searchDescription, String titleAndDescription){
		log.debug("§§§§§§§ getFlimList currentPage param: "+currentPage);
		log.debug("§§§§§§§ getFlimList rowPerPage param: "+rowPerPage);
		log.debug("§§§§§§§ getFlimList SearchWord param: "+searchWord);
		log.debug("§§§§§§§ getFlimList category param: "+category);
		log.debug("§§§§§§§ getFlimList rating param: "+rating);
		log.debug("§§§§§§§ getFlimList searchActor param: "+searchActor);
		log.debug("§§§§§§§ getFlimList price param: "+price);
		log.debug("§§§§§§§ getFlimList searchDescription param: "+searchDescription);
		log.debug("§§§§§§§ getFlimList titleAndDescription param: "+titleAndDescription);
		//list와 총 수량 구할 때 보낼 값
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = (currentPage-1)*rowPerPage;
		
		paramMap.put("rowPerPage", rowPerPage);//한 페이지 당 게시글 수
		paramMap.put("searchWord", searchWord);//제목 검색어
		paramMap.put("beginRow", beginRow);//페이지 시작 게시글 번호
		paramMap.put("category", category);//카테고리
		paramMap.put("rating", rating);//등급
		paramMap.put("searchActor", searchActor);//배우 검색
		paramMap.put("price", price);//가격
		paramMap.put("searchDescription", searchDescription);//줄거리
		paramMap.put("titleAndDescription", titleAndDescription);//줄거리 + 제목
		
		
		log.debug("§§§§§§§§ paramMap: "+paramMap);
		
		//카테고리 리스트
		List<String> categoryList = this.categoryMapper.selectCategoryList();
		log.debug("§§§§§§§§§§ categoryList: "+categoryList);
		
		//총 페이지 수에서 lastPage구하기
		int totalPage = this.filMapper.selectFilmTotal(paramMap);
		
		int lastPage = (int)Math.ceil((double)totalPage/rowPerPage);
		
		//controller로 보낼 값들 map에 넣기
		Map<String, Object> map = new HashMap<>();

		map.put("categoryList", categoryList);//카테고리 리스트
		map.put("filmList", this.filMapper.selectFilmList(paramMap));//영화 리스트
		map.put("lastPage", lastPage);//마지막 페이지
		return map;
	}
}
