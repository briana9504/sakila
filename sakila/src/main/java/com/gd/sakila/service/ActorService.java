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
		
		//배우 리스트
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
				
			Map<String, Object> returnMap = new HashMap<>();
			
			
			returnMap.put("lastPage", lastPage);
			returnMap.put("actorList", this.actorMapper.selectActorInfoList(paramMap));
			
			return returnMap;
		}
		
		//배우 추가
		public int addActor(Actor actor) {
			log.debug("■■■■■■■■■■■■■■■ Actor param: "+actor);
			return this.actorMapper.insertActor(actor);
		}

}
