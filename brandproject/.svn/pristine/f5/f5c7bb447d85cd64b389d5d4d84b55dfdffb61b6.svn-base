package com.branddog.culture.controller;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import java.io.BufferedReader;
//import java.io.InputStreamReader;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.branddog.culture.dto.CultureDTO;
import com.branddog.culture.dto.CultureWordDTO;
import com.branddog.culture.sevice.CultureServiceImpl;
import com.branddog.util.SearchConnectPythonUtill;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/culture")
@AllArgsConstructor
public class CultureController {

	private CultureServiceImpl cultureService;

	@Autowired
	ServletContext c;
	private final String module = "culture";

	@GetMapping("/search.do")
	public String searchForm(Model model) throws Exception {
//		body > div.rankingDetailBody > div:nth-child(2) > table > tbody > tr > td.prds > a > img
		String url = "http://ticket.interpark.com/contents/Ranking/RankList?pKind=P&pCate=&pType=D&pDate=";
		Document doc = Jsoup.connect(url).get();
		Elements element = doc.select("div.prdInfo");
		Elements element2 = doc.select("td.prds > a > img");
		List<String> strText = new ArrayList<String>();
		List<String> imgText = new ArrayList<String>();
//		System.out.println(element2);
		for(Element el2 : element2){
			imgText.add(el2.attr("src"));
		}
		for(Element el : element.select("b")) {
			strText.add(el.text());
		}
//		System.out.println(strText);
//		System.out.println(imgText);
//		div.thumb > a > img
		String movieurl = "https://movie.naver.com/movie/running/current.nhn?view=list&tab=normal&order=reserve";
		Document moviedoc = Jsoup.connect(movieurl).get();
		Elements moviename= moviedoc.select("div.thumb > a > img");
		Elements movieimg = moviedoc.select("div.thumb > a > img");
		List<String> movieText = new ArrayList<String>();
		List<String> movieImgText = new ArrayList<String>();
//		System.out.println(element2);
		for(Element movie : movieimg){
			movieImgText.add(movie.attr("src"));
		}
		for(Element movie2 : moviename) {
			movieText.add(movie2.attr("alt"));
		}
//		System.out.println(movieText);
//		System.out.println(movieImgText);
		model.addAttribute("moviename", movieText);
		model.addAttribute("movieimg", movieImgText);
		model.addAttribute("rank", strText);
		model.addAttribute("img", imgText);

		return module + "/search";
	}

	// 그래프 및 처리되는 부분
	@PostMapping("/graph.do")
	public String search(HttpServletRequest request, Model model) throws Exception {
		String startDate = request.getParameter("startDate");
//		System.out.println(startDate);
		String endDate = request.getParameter("endDate");
//		System.out.println(endDate);
		String timeUnit = request.getParameter("timeUnit");
//		System.out.println(timeUnit);
		String gender = request.getParameter("gender");
		if (gender.equals("t")) {
			gender = "t";
		}
//		System.out.println(gender);
		String[] ag = request.getParameterValues("ages");
//		System.out.println(ag);
		String age = String.join(",", ag);
//		System.out.println(age);
		String[] ages = new String[] { age };
//		System.out.println("ages :----------------- " + ages);
		String keyword = request.getParameter("keywords"); // 연극, 영화
		String[] keywords = keyword.trim().split(",");
//		System.out.println("keywords : --------------"+ keywords);
		SearchConnectPythonUtill.connectPython(c, startDate, endDate, timeUnit, gender, ages, keywords);
		CultureDTO dto = cultureService.search();
		String data = dto.getData();
//		System.out.println(data);
		// --------------------------선그래프 완료---------------------------------
		// --------------------------파이차트 시작---------------------------
		String searchkey = "";
		for (String key : keywords) {
			searchkey += key.trim() + ",";
		}
		searchkey = searchkey.substring(0, searchkey.lastIndexOf(","));
		searchkey = searchkey.replaceAll(" ", ",");
		System.out.println(searchkey);
		CultureWordDTO word = cultureService.word(searchkey);
		if (word == null) {
			SearchConnectPythonUtill.wordPython(c, keywords);
			model.addAttribute("word", cultureService.word(searchkey));
		} else {
			model.addAttribute("word", word);
		}
		model.addAttribute("dto", data);
		// ------------------------파이차트 끝-----------------------------
		// ----------------------자바 웹크롤링 시작--------------------------
		String clientId = "9eYRtkGNmEzbrUhDYxym"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "QFU3tG14u2"; // 애플리케이션 클라이언트 시크릿값"
		
		// ex) 연극,영화  공연 (searchkey)== > 연극,영화,,공연으로 만들어야함
		searchkey = searchkey.replaceAll(" ", ",");
//		System.out.println(searchkey);
		String text = null;
		try {
			text = URLEncoder.encode(searchkey, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text; // json 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);

//		System.out.println(responseBody);
		JSONParser jsonPaser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonPaser.parse(responseBody);
		JSONArray array = (JSONArray) jsonObject.get("items");
		List<String> title = new ArrayList<String>();
		String oldtitle = "";
		List<String> description = new ArrayList<String>();
		String olddescription = "";
		List<String> bloggername = new ArrayList<String>();
		String oldbloggername = "";
		List<String> bloggerlink = new ArrayList<String>();
		String oldbloggerlink = "";
		for (int i = 0; i < array.size(); i++) {
			JSONObject items = (JSONObject) array.get(i);
			oldtitle = ((String) items.get("title")).replaceAll("<b>", "");
			title.add(oldtitle.replaceAll("</b>", ""));
			olddescription = ((String) items.get("description")).replaceAll("<b>", "");
			description.add(olddescription.replaceAll("</b>", ""));
			oldbloggername = ((String) items.get("bloggername")).replaceAll("<b>", "");
			bloggername.add(oldbloggername.replaceAll("</b>", ""));
			oldbloggerlink = ((String) items.get("bloggerlink")).replaceAll("<b>", "");
			bloggerlink.add(oldbloggerlink.replaceAll("</b>", ""));
		}
		model.addAttribute("title", title);
		model.addAttribute("description", description);
		model.addAttribute("bloggername", bloggername);
		model.addAttribute("bloggerlink", bloggerlink);
		return module + "/graph";
	}

	
// naver API를 쓰기 위한 method
	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}
