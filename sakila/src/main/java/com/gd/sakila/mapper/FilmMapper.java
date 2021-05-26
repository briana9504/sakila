package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilmMapper {
	//영화 추가할때 배우 목록
	List<Map<String, Object>> selectActorForFilmActorInsert(int filmId);
	//영화 상세보기
	Map<String, Object> selectFilmOne(int filmId);
	//재고 확인
	List<Integer> selectFilmInStock(Map<String, Object> map);
	//영화의 총 갯수
	int selectFilmTotal(Map<String, Object> map);
	//영화 리스트
	List<Map<String, Object>> selectFilmList(Map<String, Object> map);
}
