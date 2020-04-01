package com.branddog.news.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//import java.io.BufferedReader;
//import java.io.InputStreamReader;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.branddog.news.dto.NewsDTO;
import com.branddog.news.sevice.NewsServiceImpl;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/news")
@AllArgsConstructor
public class NewsController {

	private NewsServiceImpl newsService;
	
	@Autowired
	ServletContext c;
	private final String module = "news";
	
	@GetMapping("/search.do")
	public String search(Model model)throws Exception {
		// 뉴스토픽 가져오기
		model.addAttribute("dailysch", jsoupTest());

		return module + "/search";
	}
	
	@PostMapping("/list.do")
	public String list(HttpServletRequest request, Model model) throws Exception{
		long start = System.currentTimeMillis();
		// keyword
		String keywords = request.getParameter("keywords");
		System.out.println("newsController.list().keywords : " + keywords);
		// 시작일
		String startDate = request.getParameter("startDate");
		System.out.println("newsController.list().startDate : " + startDate);
		// 종료일
		String endDate = request.getParameter("endDate");
		System.out.println("newsController.list().endDate : " + endDate);
		// timeUnit
		String timeUnit = request.getParameter("timeUnit");
		System.out.println("newsController.list().timeUnit : " + timeUnit);
		// 성별
		String gender = request.getParameter("gender");
		System.out.println("newsController.list().gender : " + gender);
		// 나이
		String[] ages1 = request.getParameterValues("ages");
		String ages2 = String.join(",", ages1);
		
		System.out.println("newsController.list().ages : " + ages2);
		
		
		System.out.println("newsController.list.word : " + keywords);
		
		NewsDTO result = newsService.list(keywords); 
		System.out.println("newsController.list.result : " + result);
		
		if (result == null) {
			System.out.println("newsController.list.if(true)");
			newsreword(keywords);
//			model.addAttribute("dto", newsService.list(keywords));
//			System.out.println(newsService.list(keywords));
		}
		else
			System.out.println("newsController.list.if(false)");
//			model.addAttribute("dto", newsService.list(keywords));
//			model.addAttribute("searchDTO", newsService.searchList());
		// 연관검색어
		newsSearchTrand(keywords, startDate, endDate, timeUnit, 
				ages2, gender);

		model.addAttribute("dto", newsService.list(keywords));
		// 기간별 검색량
		model.addAttribute("searchDTO", newsService.searchList());
		System.out.println("searchDTO : " + newsService.searchList());
		long end = System.currentTimeMillis();
		long differ = (end - start) / 1000;
		System.out.println("걸린 시간(초) : " + differ);

		return module + "/list";
	}
	
	// 파이썬 실행(news_reword.py) : 연관검색어
	public void newsreword(String keyword)throws Exception{
		
		String result;
		
		String rootPath = c.getRealPath("/data/python/news/");
		System.out.println("news.controller.list().rootpath : "+rootPath);
		
		String fileName = "news_reword.py";
		String execute = rootPath + fileName;
		System.out.println("execute : " + execute);
		
		String[] command = new String[] {"python ", execute, keyword};
		
		ProcessBuilder builder = new ProcessBuilder(command);
//		Process process = builder.start();
		
		builder.redirectOutput(Redirect.INHERIT);
	    builder.redirectError(Redirect.INHERIT);
	    
	    Process p = builder.start();
	    
	    System.out.println("**************************");
	    printStream(p);
	    
	    BufferedReader stdOut = new BufferedReader(new InputStreamReader(p.getInputStream()));
	    System.out.println("stdOut : " + stdOut.readLine());
	    BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));
	    
//	    BufferedReader stdOut = new BufferedReader(new InputStreamReader(p.getInputStream()))
	    
	    while((result = stdOut.readLine()) != null){
	    	System.out.println("stdOut : " + result);
	    }

	    while((result = stdError.readLine()) != null){
	    	System.out.println("stdError : " + result);
	    }
		
	}
	
	// 파이썬 실행(news_searchtrand.py) : 검색한 키워드가 뉴스에 나오는 퍼센트
	public void newsSearchTrand(String keywords, String startDate, 
		String endDate, String timeUnit, String ages, String gender)throws Exception{
		
		String result;
		
		String rootPath = c.getRealPath("/data/python/news/");
		System.out.println("news.controller.list().rootpath : "+rootPath);
		
		String fileName = "news_searchtrand.py";
		String execute = rootPath + fileName;
		System.out.println("execute : " + execute);
		
		String[] command = new String[] {"python ", execute, keywords, 
				startDate, endDate, timeUnit, ages, gender};
		
		ProcessBuilder builder = new ProcessBuilder(command);
//		Process process = builder.start();
		
		builder.redirectOutput(Redirect.INHERIT);
	    builder.redirectError(Redirect.INHERIT);
	    
	    Process p = builder.start();
	    
	    System.out.println("**************************");
	    printStream(p);
	    
	    BufferedReader stdOut = new BufferedReader(new InputStreamReader(p.getInputStream()));
	    System.out.println("stdOut : " + stdOut.readLine());
	    BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));
	    
//	    BufferedReader stdOut = new BufferedReader(new InputStreamReader(p.getInputStream()))
	    
	    while((result = stdOut.readLine()) != null){
	    	System.out.println("stdOut : " + result);
	    }

	    while((result = stdError.readLine()) != null){
	    	System.out.println("stdError : " + result);
	    }
		
	}
	
	private void printStream(Process process)throws Exception{
		process.waitFor();
		try (InputStream psout = process.getInputStream()) {
            copy(psout, System.out);
		}
	}
	
	 public void copy(InputStream input, OutputStream output) throws Exception {
        byte[] buffer = new byte[1024];
        int n = 0;
        while ((n = input.read(buffer)) != -1) {
            output.write(buffer, 0, n);
        }
	 }
	 
	 // jsoup을 사용해서 실시간으로 naver.com에서 뉴스토픽 가져오기
	 public List<String> jsoupTest() throws Exception{
			
			
			String url = "https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=";
			
			Document doc = Jsoup.connect(url).get();

			Elements arrDiv = doc.select("ol>li>a");
			List<String> strText = new ArrayList<String>();
			
			System.out.println("arrDiv" + arrDiv);
			
//			for(Element clsDiv : arrDiv) {
//				if(clsDiv.hasClass("tit"))continue;
//				
//				String text = clsDiv.text();
//				text = text.substring(1);
//				
//				strText.add(text);
//			}
			
			for(int i=0; i < 10; i++) {
				Element tt = arrDiv.get(i);
				if(tt.hasClass("tit"))continue;
				
				String text = tt.text();
				if(i <9)
					text = text.substring(1);
				if(i > 8)
					text = text.substring(2);
				
				text = text.replace("NEW", "");
				System.out.println("tt : " + tt.text());
				strText.add(text);
			}
			
			System.out.println("********************************");
			System.out.println("!!" + strText + "!!");
			
			return strText;
		}
	 
	 
}