package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilmMapper {
	List<String> selectCategoryList();
	Map<String, Object> selectFilmOne(int filmId);
	List<Integer> selectFilmInStock(Map<String, Object> map);
	int selectFilmTotal(String searchWord);
	List<Map<String, Object>> selectFilmList(Map<String, Object> map);
}