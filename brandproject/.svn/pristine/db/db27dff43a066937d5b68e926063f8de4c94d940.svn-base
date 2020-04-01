package com.branddog.culture.sevice;


import org.springframework.stereotype.Service;

import com.branddog.culture.dto.CultureDTO;
import com.branddog.culture.dto.CultureWordDTO;
import com.branddog.culture.mapper.CultureMapper;

import lombok.AllArgsConstructor;
//import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
//@Log4j
public class CultureServiceImpl implements CultureService{

	private CultureMapper mapper; 
	
	@Override
	public CultureDTO search() {
		// TODO Auto-generated method stub
		return mapper.search();
	} 
	@Override
	public CultureWordDTO word(String word) {
		// TODO Auto-generated method stub
		return mapper.word(word);
	} 


}
