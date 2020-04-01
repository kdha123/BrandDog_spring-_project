package com.branddog.newssearchtrand.dto;

import lombok.Data;

@Data
public class NewsSearchTrandDTO {

	private int no;
	private String startDate, endDate;
	private String timeUnit, title, keywords, data;
	
}
