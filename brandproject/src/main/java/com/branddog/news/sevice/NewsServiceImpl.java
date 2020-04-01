package com.branddog.news.sevice;

import org.springframework.stereotype.Service;

import com.branddog.news.dto.NewsDTO;
import com.branddog.news.mapper.NewsMapper;
import com.branddog.newssearchtrand.dto.NewsSearchTrandDTO;

import lombok.AllArgsConstructor;
//import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
//@Log4j
public class NewsServiceImpl implements NewsService{

	private NewsMapper mapper; 
	
	@Override
	public NewsDTO list(String word) {
		// TODO Auto-generated method stub
		return mapper.list(word);
	} 
	
	@Override
	public NewsSearchTrandDTO searchList() {
		// TODO Auto-generated method stub
		return mapper.searchList();
	}

	@Override
	public Integer write(NewsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.write(dto);
	}

	@Override
	public Integer update(NewsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public Integer delete(NewsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.delete(dto);
	}
}
