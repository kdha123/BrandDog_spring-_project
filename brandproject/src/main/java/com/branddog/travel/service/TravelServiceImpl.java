package com.branddog.travel.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.branddog.travel.dto.TravelReWordDTO;
import com.branddog.travel.dto.TravelSearchDTO;
import com.branddog.travel.mapper.TravelMapper;
import com.branddog.util.TravelBlogData;

import lombok.AllArgsConstructor;

@Service
@Qualifier("ts")
@AllArgsConstructor
public class TravelServiceImpl implements TravelService {
	
	private TravelMapper mapper;

	@Override
	public TravelSearchDTO searchTrend(int no) {
		// TODO Auto-generated method stub
		
		return mapper.getSearchTrendData(no);
	}

	@Override
	public TravelReWordDTO reWordCheck(String title) {
		// TODO Auto-generated method stub
		return mapper.reWordCheck(title);
	}

	@Override
	public void hanatour() throws IOException {
		// TODO Auto-generated method stub
		String url = "http://minfo.hanatour.com/";
		Document doc = Jsoup.connect(url).get();
		
		Elements links = doc.select("div.rankingArea > ul > li > a");
		List<String> linkList = new ArrayList<String>();
		System.out.println("JAVA Jsoup Test 중!============");
		for(Element link : links) {
			System.out.println(link.attr("href"));
			linkList.add(link.attr("href"));
		}
		System.out.println("=======================================");
	}
	
	@Override
	public Map<String, List<String>> getBlogData(String searchKey) throws Exception {
		// TODO Auto-generated method stub
		String responseBody = TravelBlogData.getBlogData(searchKey);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(responseBody);
		JSONArray jsonArray = (JSONArray) jsonObject.get("items");
		
		List<String> blogName = new ArrayList<String>();
		List<String> blogTitle = new ArrayList<String>();
		List<String> blogDescript = new ArrayList<String>();
		List<String> blogLink = new ArrayList<String>();
		List<String> blogDocLink = new ArrayList<String>();
		
		for(int i = 0; i < jsonArray.size(); i++) {
			JSONObject items = (JSONObject) jsonArray.get(i);
			blogTitle.add(((String) items.get("title")).replaceAll("<b>", "").replaceAll("</b>", ""));
			blogDescript.add(((String) items.get("description")).replaceAll("<b>", "").replaceAll("</b>", ""));
			blogName.add(((String) items.get("bloggername")).replaceAll("<b>", "").replaceAll("</b>", ""));
			blogLink.add(((String) items.get("bloggerlink")).replaceAll("<b>", "").replaceAll("</b>", ""));
			blogDocLink.add(((String) items.get("link")).replaceAll("<b>", "").replaceAll("</b>", ""));
		}
		
		Map<String, List<String>> blogDataMap = new HashMap<String, List<String>>();
		blogDataMap.put("title", blogTitle);
		blogDataMap.put("description", blogDescript);
		blogDataMap.put("name", blogName);
		blogDataMap.put("link", blogLink);
		blogDataMap.put("doclink", blogDocLink);
		
		return blogDataMap;
	}
	
	@Override
	public List<String> setWordData(TravelReWordDTO dto) {
		// TODO Auto-generated method stub
		List<String> dataList = new ArrayList<String>();
		
		dataList.add(dto.getWord1().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord2().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord3().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord4().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord5().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord6().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord7().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord8().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord9().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord10().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord11().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord12().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord13().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord14().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord15().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord16().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord17().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord18().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord19().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord20().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord21().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord22().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord23().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord24().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord25().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord26().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord27().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord28().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord29().replace("[", "").replace("]", "").replace("\"", ""));
		dataList.add(dto.getWord30().replace("[", "").replace("]", "").replace("\"", ""));
		
		return dataList;
	}

	
}
