package com.gd.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm { //폼 내용을 그대로 받을 수 있음
	//객체지향: // 외래키 - > film_id -> film table을 대표 
	private Category category;
	private Film film;//fm -> private Film[] film --> 많은 film이 하나의 category를 참조 할 수 있음
	private String lastUpdate;
	private List<String> specialFeatures;
	
	public void setSpecialFeatures(List<String> specialFeatures) {
		StringBuffer sb = new StringBuffer();
		if(specialFeatures != null) {
			for(String sf: specialFeatures) {
				sb.append(sf+",");
			}
		}
		this.film.setSpecialFeatures(sb.toString().substring(0, sb.toString().length()-1));
		
		this.specialFeatures = specialFeatures;
	}
	
}