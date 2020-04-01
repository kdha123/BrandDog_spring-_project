package com.branddog.food.controller;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.branddog.food.sevice.FoodServiceImpl;

import lombok.AllArgsConstructor;



@Controller
@RequestMapping("/food")
@AllArgsConstructor
public class FoodController {

	@Autowired
	ServletContext c;
	private final String module = "food";
	
	private FoodServiceImpl Service;
	
	
	
	
	
	@GetMapping("/list.do")
	public String list() throws Exception{
		return module+"/list";
}
	
	@GetMapping("/view.do")
	public String view(@RequestParam("food") String food,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("timeUnit") String timeUnit,
			@RequestParam("gender") String gender,
			@RequestParam("ages") String ages,			
			Model model) throws Exception {			
		
		foodreword(food);
		
		foodnaver(food,startDate,endDate,timeUnit,gender,ages);
		
		
		model.addAttribute("dto",Service.view());
		model.addAttribute("count",Service.count(food));
		model.addAttribute("dtod",Service.view2());
		
		String clientId = "H7SI5PudiEMFJ_Dn5vzZ"; //애플리케이션 클라이언트 아이디값"
	    String clientSecret = "v705i4gGdX"; //애플리케이션 클라이언트 시크릿값"

	    String text = null;
	    try {
	        text = URLEncoder.encode(food, "UTF-8");
	    } catch (UnsupportedEncodingException e) {
	        throw new RuntimeException("검색어 인코딩 실패",e);
	    }
	    System.out.println(text);
	    String apiURL = "https://openapi.naver.com/v1/search/shop.json?query=" + text;    // json 결과
	    //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과

	    Map<String, String> requestHeaders = new HashMap<>();
	    requestHeaders.put("X-Naver-Client-Id", clientId);
	    requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	    String responseBody = get(apiURL,requestHeaders);

	    System.out.println(responseBody);

	    JSONParser jsonParser= new JSONParser();
	    
	    try {
			JSONObject jsonObject = (JSONObject) jsonParser.parse(responseBody);
			JSONArray items = (JSONArray) jsonObject.get("items"); 
			System.out.println("아이템스");
			
				JSONObject tempObj = (JSONObject) items.get(0);
				System.out.println(tempObj);
				String a1=(String) tempObj.get("title");
				String a2=(String) tempObj.get("lprice");
				String a3=(String) tempObj.get("link");
				String a4=(String) tempObj.get("image");
				
				JSONObject tempObj1 = (JSONObject) items.get(1);
				
				String b1=(String) tempObj1.get("title");
				String b2=(String) tempObj1.get("lprice");
				String b3=(String) tempObj1.get("link");
				String b4=(String) tempObj1.get("image");
				
				JSONObject tempObj2 = (JSONObject) items.get(2);
				String c1=(String) tempObj2.get("title");
				String c2=(String) tempObj2.get("lprice");
				String c3=(String) tempObj2.get("link");
				String c4=(String) tempObj2.get("image");
				
				JSONObject tempObj3 = (JSONObject) items.get(3);
				String d1=(String) tempObj3.get("title");
				String d2=(String) tempObj3.get("lprice");
				String d3=(String) tempObj3.get("link");
				String d4=(String) tempObj3.get("image");
				
				JSONObject tempObj4 = (JSONObject) items.get(4);
				String e1=(String) tempObj4.get("title");
				String e2=(String) tempObj4.get("lprice");
				String e3=(String) tempObj4.get("link");
				String e4=(String) tempObj4.get("image");
				
				model.addAttribute("a1",a1);
				model.addAttribute("a2",a2);
				model.addAttribute("a3",a3);
				model.addAttribute("a4",a4);
				model.addAttribute("b1",b1);
				model.addAttribute("b2",b2);
				model.addAttribute("b3",b3);
				model.addAttribute("b4",b4);
				model.addAttribute("c1",c1);
				model.addAttribute("c2",c2);
				model.addAttribute("c3",c3);
				model.addAttribute("c4",c4);
				model.addAttribute("d1",d1);
				model.addAttribute("d2",d2);
				model.addAttribute("d3",d3);
				model.addAttribute("d4",d4);
				model.addAttribute("e1",e1);
				model.addAttribute("e2",e2);
				model.addAttribute("e3",e3);
				model.addAttribute("e4",e4);
				System.out.println(a1);
				System.out.println(e1);
				System.out.println(c3);
	    } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return module+"/view";
	}
	
public void foodreword(String word) throws Exception{
	
	String fileName = "foodRe.py";
	String rootPath = c.getRealPath("/data/python/food/");
	String execute = rootPath + fileName;
	System.out.println("execute : " + execute);
	
	String key =  word;
	
	
	String[] command = new String[] {"python ", execute, key};
	
	ProcessBuilder builder = new ProcessBuilder(command);
	//Process process = builder.start();
	
	builder.redirectOutput(Redirect.INHERIT);
    builder.redirectError(Redirect.INHERIT);
    
    Process p = builder.start();
    System.out.println("**************************");
    printStream(p);
    
    BufferedReader stdOut = new BufferedReader(new InputStreamReader(p.getInputStream()));
    BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));
    
    String result = "";
    
    while((result = stdOut.readLine()) != null){
    	System.out.println(result);
    }

    while((result = stdError.readLine()) != null){
    	System.out.println(result);
    }		
	
	
	
	
}
public void foodnaver(String food,String word1,String word2,String word3,String word4,String word5) throws Exception{
	
	String fileName = "naver.py";
	String rootPath = c.getRealPath("/data/python/food/");
	String execute = rootPath + fileName;
	System.out.println("execute : " + execute);
	
	String key =  food;
	System.out.println(key);
	
	String[] command = new String[] {"python ", execute, key,word1,word2,word3,word4,word5};
	
	ProcessBuilder builder = new ProcessBuilder(command);
	//Process process = builder.start();
	
	builder.redirectOutput(Redirect.INHERIT);
	builder.redirectError(Redirect.INHERIT);
	
	Process p = builder.start();
	System.out.println("**************************");
	printStream(p);
	
	BufferedReader stdOut = new BufferedReader(new InputStreamReader(p.getInputStream()));
	BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));
	
	String result = "";
	
	while((result = stdOut.readLine()) != null){
		System.out.println(result);
	}
	
	while((result = stdError.readLine()) != null){
		System.out.println(result);
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
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
	    HttpURLConnection con = connect(apiUrl);
	    try {
	        con.setRequestMethod("GET");
	        for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
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

	private static HttpURLConnection connect(String apiUrl){
	    try {
	        URL url = new URL(apiUrl);
	        return (HttpURLConnection)url.openConnection();
	    } catch (MalformedURLException e) {
	        throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	    } catch (IOException e) {
	        throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	    }
	}

	private static String readBody(InputStream body){
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