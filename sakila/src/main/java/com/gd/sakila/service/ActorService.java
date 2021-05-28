package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.ActorMapper;
import com.gd.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class ActorService {
		@Autowired
		ActorMapper actorMapper;
		
		//배우 리스트   -- > info: 를 어떻게 가공하여 보여주어야 하는가?
		public Map<String, Object> getActorInfoList(int currentPage, int rowPerPage, String searchWord, String searchFilm){
			log.debug("■■■■■■■■■■■■■■■ currentPage param:" + currentPage);
			log.debug("■■■■■■■■■■■■■■■ rowPerPage param:" + rowPerPage);
			log.debug("■■■■■■■■■■■■■■■ searchWord param:" + searchWord);
			log.debug("■■■■■■■■■■■■■■■ searchWord param:" + searchFilm);
			
			int beginRow = (currentPage-1)*rowPerPage;
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("beginRow", beginRow);
			paramMap.put("rowPerPage", rowPerPage);
			paramMap.put("searchWord", searchWord);
			paramMap.put("searchFilm", searchFilm);
			
			log.debug("■■■■■■■■■■■■■■■ paramMap param:" + paramMap);
			
			// 전체 게시물에서 마지막 페이지 검색
			int totalRow = this.actorMapper.selectActorInfoTotal(paramMap);
			int lastPage = (int)Math.ceil((double)totalRow/rowPerPage);
			log.debug("■■■■■■■■■■■■■■■ totalRow:" + totalRow);
			log.debug("■■■■■■■■■■■■■■■ lastPage:" + lastPage);

			List<Map<String, Object>> list = this.actorMapper.selectActorInfoList(paramMap);
			
			/*
			 * 고민하기! info 깔끔하게 보게하는 방법 고민!
			 * 
			for(Map<String, Object> map: list) {
				map.get("actorInfo");
			}
			
			*/
			
			Map<String, Object> returnMap = new HashMap<>();
			
			
			returnMap.put("lastPage", lastPage);
			returnMap.put("actorList", list);
			
			return returnMap;
		}
		
		//배우 추가
		public int addActor(Actor actor) {
			log.debug("■■■■■■■■■■■■■■■ Actor param: "+actor);
			return this.actorMapper.insertActor(actor);
		}

}
