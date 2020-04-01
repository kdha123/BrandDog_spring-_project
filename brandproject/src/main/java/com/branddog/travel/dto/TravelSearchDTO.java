package com.branddog.travel.dto;

import lombok.Data;

@Data
public class TravelSearchDTO {
	
	private int no;
	private String startDate, endDate, timeUnit, title, keywords, data;
	
}
