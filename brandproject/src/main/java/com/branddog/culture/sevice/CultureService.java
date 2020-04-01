package com.branddog.culture.sevice;


import com.branddog.culture.dto.CultureDTO;
import com.branddog.culture.dto.CultureWordDTO;

public interface CultureService {

	public CultureDTO search();
	
	public CultureWordDTO word(String word);

}
