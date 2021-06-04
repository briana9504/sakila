package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.mapper.LanguageMapper;
import com.gd.sakila.vo.Category;
import com.gd.sakila.vo.Film;
import com.gd.sakila.vo.FilmForm;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class FilmService {
	@Autowired
	CategoryMapper categoryMapper;
	@Autowired
	FilmMapper filmMapper;

	//인벤토리 추가용 영화목록
	public List<Film> getFilmListByInventory(){
		return this.filmMapper.selectFilmListByInventory();
	}
	
	
	//영화 추가 => param: film입력폼, return: 입력된 filmId값 리턴
	public int addFilm(FilmForm filmForm) {//참조타입은 필드명과 named 같으면 맵핑, 기본(값)타입 매개변수의 이름과 name이 같으면 맵핑 setFilmId
		log.debug("■■■■■■■■■■■ filmForm param: "+ filmForm);
		
		Film film = filmForm.getFilm();
		this.filmMapper.insertFilm(film);// insert 후 film.setFilmId(생성된 값)호출
		Map<String, Object> map = new HashMap<>();
		map.put("categoryId", filmForm.getCategory().getCategoryId());
		map.put("filmId", film.getFilmId());
		
		this.filmMapper.insertFilmCategory(map);
		
		return film.getFilmId();
	}
	
	// 영화 출연배우 수정
	public int modifyFilmActor(List<Integer> actorId, int filmId) {
		log.debug("■■■■■■■■■■■■■■■■ actorId param: "+actorId);
		log.debug("■■■■■■■■■■■■■■■■ filmId param: "+filmId);
		
		//본래 출연진 삭제
		int deleteRow = this.filmMapper.deleteFilmActors(filmId);
		log.debug("■■■■■■■■■■■■■■■■ 삭제된 출연진 수: "+deleteRow);
		
		//출연진 insert
		if(actorId == null) {
			return 0;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("filmId", filmId);
		map.put("actorId", actorId);
		
		int insertRow = this.filmMapper.insertFilmActors(map);
		
		log.debug("■■■■■■■■■■■■■■■■ 추가된 출연진 수: "+insertRow);
		
		return insertRow;
	}
	
	//영하 추가 배우목록 보기!
	public List<Map<String, Object>> getFilmActorListByFilm(int filmId){
		log.debug("■■■■■■■■■■■■■■■■ filmId param: "+filmId);
		return this.filmMapper.selectFilmActorListByFilm(filmId);
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
		
		List<Integer> list = this.filmMapper.selectFilmInStock(paramMap1);
		
		//2번 store 재고량 구하기
		Map<String, Object> paramMap2 = new HashMap<String, Object>();
		paramMap2.put("filmId", filmId);
		paramMap2.put("storeId", 2);
		int filmCount2 = 0; //out용
		paramMap2.put("filmCount", filmCount2);
			
		this.filmMapper.selectFilmInStock(paramMap2);
		
		log.debug("■■■■■■■■■■■■■■■■ filmCount1: " + paramMap1.get("filmCount"));
		log.debug("■■■■■■■■■■■■■■■■ filmCount2: " + paramMap2.get("filmCount"));
		log.debug("■■■■■■■■■■■■■■■■ row: " + list);
		
		//controller로 보낼 값 map에 넣기
		Map<String, Object> returnMap = new HashMap<>();
		//1번 스토어 재고량
		returnMap.put("countInvetory1", paramMap1.get("filmCount"));
		//2번 스토어 재고량
		returnMap.put("countInvetory2", paramMap2.get("filmCount"));
		
		//영화 정보
		returnMap.put("filmOne", this.filmMapper.selectFilmOne(filmId));
		
		return returnMap;
	}
	//film list
	public Map<String, Object> getFilmList(int currentPage, int rowPerPage, String searchWord, String category, String rating, String searchActor, Double price, String searchDescription, String titleAndDescription){
		log.debug("■■■■■■■■■■■■■■■■ getFlimList currentPage param: "+currentPage);
		log.debug("■■■■■■■■■■■■■■■■ getFlimList rowPerPage param: "+rowPerPage);
		log.debug("■■■■■■■■■■■■■■■■ getFlimList SearchWord param: "+searchWord);
		log.debug("■■■■■■■■■■■■■■■■ getFlimList category param: "+category);
		log.debug("■■■■■■■■■■■■■■■■ getFlimList rating param: "+rating);
		log.debug("■■■■■■■■■■■■■■■■ getFlimList searchActor param: "+searchActor);
		log.debug("■■■■■■■■■■■■■■■■ getFlimList price param: "+price);
		log.debug("■■■■■■■■■■■■■■■■ getFlimList searchDescription param: "+searchDescription);
		log.debug("■■■■■■■■■■■■■■■■ getFlimList titleAndDescription param: "+titleAndDescription);
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
		
		//총 페이지 수에서 lastPage구하기
		int totalPage = this.filmMapper.selectFilmTotal(paramMap);
		
		int lastPage = (int)Math.ceil((double)totalPage/rowPerPage);
		
		//controller로 보낼 값들 map에 넣기
		Map<String, Object> map = new HashMap<>();

		map.put("filmList", this.filmMapper.selectFilmList(paramMap));//영화 리스트
		map.put("lastPage", lastPage);//마지막 페이지
		return map;
	}
}
