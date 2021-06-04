package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.vo.Category;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Transactional
@Service
public class CategoryService {
	@Autowired
	CategoryMapper categoryMapper;
	
	//차트 그리기용 카테고리 매출 리스트
	public List<Map<String, Object>> getSalesByFilmCategory(){
		
		return this.categoryMapper.selectSalesByFilmCategory();
	}
	
	public List<Category> getCategoryList(){
		
		return this.categoryMapper.selectCategoryList();
	}
}
