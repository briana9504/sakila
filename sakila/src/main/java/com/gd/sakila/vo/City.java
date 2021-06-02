package com.gd.sakila.vo;

import lombok.Data;

@Data
public class City {
	private int cityId;
	private String city;
	private String countryId;
	private String lastUpdate;
}
