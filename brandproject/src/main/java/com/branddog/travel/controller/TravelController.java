package com.branddog.travel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.branddog.travel.dto.TravelReWordDTO;
import com.branddog.travel.service.TravelServiceImpl;
import com.branddog.util.TravelPythonConnectUtil;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/travel")
@AllArgsConstructor
public class TravelController {

	@Autowired
	ServletContext c;
	
	private final String module = "travel";
	
	@Qualifier("ts")
	@Autowired
	private TravelServiceImpl service;
	
	@GetMapping("/search.do")
	public String search(Model model) throws Exception{
		// 하나투어에서 크롤링 하기
		service.hanatour();
		
		return module + "/search";
	}

	@PostMapping("/graph.do")
	public String report(Model model, String title, String keywords, String startDate, String endDate, String timeUnit, String gender, String[] ages) throws Exception {
		long start = System.currentTimeMillis();
		
		// 넘어오는 데이터 받기
		
		System.out.println("=============================== Spring Data");
		System.out.println("TravelController.report().title       : " + title);
		System.out.println("TravelController.report().keywords    : " + keywords);
		System.out.println("TravelController.report().startDate   : " + startDate);
		System.out.println("TravelController.report().endDate     : " + endDate);
		System.out.println("TravelController.report().timeUnit    : " + timeUnit);
		System.out.println("TravelController.report().gender      : " + gender);
		System.out.println("TravelController.report().ages[]      : " + ages);
		for(String age : ages)
			System.out.println("TravelController.report().age         : " + age);
		System.out.println("=============================== Spring Data");
		
		// Start of Related Word Crawl And SearchTrend API
		String check = "2";
		// "속초","강릉"
		String[] searchKeys = keywords.split(",");
		String searchKey = "";
		for(String str : searchKeys) {
			searchKey += str.trim() + ",";
		}
		searchKey = searchKey.substring(0, searchKey.lastIndexOf(","));
		System.out.println("TravelController.report().searchKey   : " + searchKey);

		TravelReWordDTO reWordDTO = service.reWordCheck(searchKey);
		System.out.println("TravelController.report().reWordDTO   : " + reWordDTO);
		
		// dto가 null이다. -> 새로운 검색 데이터, dto가 not null 이다. -> 이미 검색했던 데이터
		if(reWordDTO == null) {
			// 파이썬 실행해야 한다.
			check = "1";
		}
		
		System.out.println("Start of Related Word Crawl And SearchTrend API");
		
		String strNo = TravelPythonConnectUtil.executePython(c, keywords, startDate, endDate, timeUnit, gender, ages, check);
		System.out.println("TravelController.report().strNo      : " + strNo);
		// Python 끝-----------------------------------------------------------------------------------------------------------
		
		int no = Integer.parseInt(strNo.substring(strNo.lastIndexOf(" ") + 1));
		System.out.println("TravelController.report().no        : " + no);
		
		String data = service.searchTrend(no).getData();
		System.out.println("결과 : TravelController.report().data : " + data);
		
		// SearchTrend 결과 데이터
		model.addAttribute("data", data);
		
		// Related Word 결과 데이터
		// TravelReWordDTO(no=4, title=치앙마이, word1=["태국", 54], word2=["여행", 38], word3=["살기", 33], word4=["카페", 20], word5=["마켓", 16], word6=["호텔", 15], word7=["방콕", 14], word8=["혼자", 13], word9=["숙소", 13], word10=["코로나", 13])
		if(check.equals("2")) {
			model.addAttribute("reWord", reWordDTO);
			System.out.println("결과 : TravelController.report().reWordDTO : " + reWordDTO);
		} else {
			reWordDTO = service.reWordCheck(keywords);
			model.addAttribute("reWord", reWordDTO);
			System.out.println("결과 : TravelController.report().reWordDTO : " + service.reWordCheck(keywords));
		}
		
		// 연관어 데이터만 따로 List에 담는다.
		List<String> dataList = service.setWordData(reWordDTO);
		System.out.println("결과 : TravelController.report().dataList : " + dataList);
		model.addAttribute("list", dataList);
		
		// 실시간 Blog 데이터
		Map<String, List<String>> blogData = service.getBlogData(searchKey);
		model.addAttribute("blogdata", blogData);
		
		System.out.println("End of Related Word Crawl And SearchTrend API");
		
		long end = System.currentTimeMillis();
		long secDiffTime = (end - start) / 1000;
		
		System.out.println("걸린 시간(초) : " + secDiffTime);
		
		return module + "/graph";
	}
	
}
