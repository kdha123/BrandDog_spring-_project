package com.branddog.culture.mapper;


import com.branddog.culture.dto.CultureDTO;
import com.branddog.culture.dto.CultureWordDTO;

public interface CultureMapper {

	public CultureDTO search();
	
	public CultureWordDTO word(String word);
	
	
}
