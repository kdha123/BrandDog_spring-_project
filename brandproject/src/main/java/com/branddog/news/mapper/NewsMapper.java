package com.branddog.news.mapper;

import com.branddog.news.dto.NewsDTO;
import com.branddog.newssearchtrand.dto.NewsSearchTrandDTO;

public interface NewsMapper {

	public NewsDTO list(String word);
	
	public NewsSearchTrandDTO searchList();
	
	public Integer write(NewsDTO dto);
	
	public Integer update(NewsDTO dto);
	
	public Integer delete(NewsDTO dto);
	
}
