package com.branddog.travel.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.branddog.travel.dto.TravelReWordDTO;
import com.branddog.travel.dto.TravelSearchDTO;

public interface TravelService {
	
	public TravelSearchDTO searchTrend(int no);
	
	public TravelReWordDTO reWordCheck(String title);
	
	public List<String> setWordData(TravelReWordDTO dto);
	
	public void hanatour() throws IOException;
	
	public Map<String, List<String>> getBlogData(String searchKey) throws Exception;
	
}
