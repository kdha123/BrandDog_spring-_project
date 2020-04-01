package com.branddog.jsouptest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.OutputStream;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.branddog.news.dto.NewsDTO;
import com.branddog.news.sevice.NewsServiceImpl;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/test")
@AllArgsConstructor
public class JsoupTest {
	
	NewsServiceImpl newsService;
	
	@GetMapping("got_social_graph.json")
	public String list(@RequestParam("keywords") String keywords, Model model) throws Exception{
		
		System.out.println("keywords : " + keywords);
		System.out.println("jsouptest.newsService : " + newsService.list(keywords));
		NewsDTO dto = newsService.list(keywords);
		
		// jsp 파일 저장하기
		
		OutputStream output = new FileOutputStream("D:\\spring workspace\\brandproject\\src\\main\\webapp\\resources\\d3data\\got_social_graph.json");
		// word1 ~ word10
		String word1 = dto.getWord1();
		String[] word_1 = word1.split(",");
		word1 = word_1[0];
		System.out.println("word1 : "+ word1);
		
		String word2 = dto.getWord2();
		String[] word_2 = word2.split(",");
		word2 = word_2[0];
		System.out.println("word2 : "+ word2);
		
		String word3 = dto.getWord3();
		String[] word_3 = word3.split(",");
		word3 = word_3[0];
		System.out.println("word3 : "+ word3);
		
		String word4 = dto.getWord4();
		String[] word_4 = word4.split(",");
		word4 = word_4[0];
		System.out.println("word4 : "+ word4);
		
		String word5 = dto.getWord5();
		String[] word_5 = word5.split(",");
		word5 = word_5[0];
		System.out.println("word5 : "+ word5);
		
		String word6 = dto.getWord6();
		String[] word_6 = word6.split(",");
		word6 = word_6[0];
		System.out.println("word6 : "+ word6);
		
		String word7 = dto.getWord7();
		String[] word_7 = word7.split(",");
		word7 = word_7[0];
		System.out.println("word7 : "+ word7);
		
		String word8 = dto.getWord8();
		String[] word_8 = word8.split(",");
		word8 = word_8[0];
		System.out.println("word8 : "+ word8);
		
		String word9 = dto.getWord9();
		String[] word_9 = word9.split(",");
		word9 = word_9[0];
		System.out.println("word9 : "+ word9);
		
		String word10 = dto.getWord10();
		String[] word_10 = word10.split(",");
		word10 = word_10[0];
		System.out.println("word10 : "+ word10);
		
		// json 형식
		String str = "{\"nodes\":[{\"character\":"+ word1 +",\"id\":0,\"influence\":35,\"zone\":1},"
						 + "{\"character\":"+ word2 +",\"id\":1,\"influence\":25,\"zone\":2},"
						 + "{\"character\":"+ word3 +",\"id\":2,\"influence\":25,\"zone\":3},"
						 + "{\"character\":"+ word4 +",\"id\":3,\"influence\":25,\"zone\":4},"
						 + "{\"character\":"+ word5 +",\"id\":4,\"influence\":20,\"zone\":5},"
						 + "{\"character\":"+ word6 +",\"id\":5,\"influence\":20,\"zone\":6},"
						 + "{\"character\":"+ word7 +",\"id\":6,\"influence\":20,\"zone\":7},"
						 + "{\"character\":"+ word8 +",\"id\":7,\"influence\":15,\"zone\":8},"
						 + "{\"character\":"+ word9 +",\"id\":8,\"influence\":15,\"zone\":9},"
						 + "{\"character\":"+ word10+",\"id\":9,\"influence\":15,\"zone\":10}],\"links\":[{\"source\":0,\"target\":2,\"weight\":5},{\"source\":0,\"target\":1,\"weight\":5},{\"source\":0,\"target\":3,\"weight\":5},{\"source\":0,\"target\":4,\"weight\":5},{\"source\":0,\"target\":5,\"weight\":5},{\"source\":0,\"target\":6,\"weight\":5},{\"source\":0,\"target\":7,\"weight\":5},{\"source\":0,\"target\":8,\"weight\":5},{\"source\":0,\"target\":9,\"weight\":5}]}";
		byte[] by = str.getBytes();
		output.write(by);
		System.out.println("json 문서 작성 완료");
		
		return "test/got_social_graph";
	}
	
	@GetMapping("d3jstest01.do")
	public String d3jsTest01() {
		return "test/d3jstest01";
	}
	
	@GetMapping("d3jstest02.do")
	public String d3jsTest02() {
		return "test/d3jstest02";
	}
	
	@GetMapping("d3jstest03.do")
	public String d3jsTest03() throws Exception{
//		
//		String keywords = "코로나";
//		
//		NewsDTO dto = newsService.list(keywords);
//		
//		// jsp 파일 저장하기
//		
//		OutputStream output = new FileOutputStream("D:\\spring workspace\\brandproject\\src\\main\\webapp\\resources\\d3data\\got_social_graph.json");
//		// word1 ~ word10D:\workspace\spring\brandproject
//		String word1 = dto.getWord1();
//		String[] word_1 = word1.split(",");
//		word1 = word_1[0];
//		System.out.println("word1 : "+ word1);
//		
//		String word2 = dto.getWord2();
//		String[] word_2 = word2.split(",");
//		word2 = word_2[0];
//		System.out.println("word2 : "+ word2);
//		
//		String word3 = dto.getWord3();
//		String[] word_3 = word3.split(",");
//		word3 = word_3[0];
//		System.out.println("word3 : "+ word3);
//		
//		String word4 = dto.getWord4();
//		String[] word_4 = word4.split(",");
//		word4 = word_4[0];
//		System.out.println("word4 : "+ word4);
//		
//		String word5 = dto.getWord5();
//		String[] word_5 = word5.split(",");
//		word5 = word_5[0];
//		System.out.println("word5 : "+ word5);
//		
//		String word6 = dto.getWord6();
//		String[] word_6 = word6.split(",");
//		word6 = word_6[0];
//		System.out.println("word6 : "+ word6);
//		
//		String word7 = dto.getWord7();
//		String[] word_7 = word7.split(",");
//		word7 = word_7[0];
//		System.out.println("word7 : "+ word7);
//		
//		String word8 = dto.getWord8();
//		String[] word_8 = word8.split(",");
//		word8 = word_8[0];
//		System.out.println("word8 : "+ word8);
//		
//		String word9 = dto.getWord9();
//		String[] word_9 = word9.split(",");
//		word9 = word_9[0];
//		System.out.println("word9 : "+ word9);
//		
//		String word10 = dto.getWord10();
//		String[] word_10 = word10.split(",");
//		word10 = word_10[0];
//		System.out.println("word10 : "+ word10);
//		
//		// json 형식
//		String str = "{\"nodes\":[{\"character\":"+ word1 +",\"id\":0,\"influence\":35,\"zone\":1},"
//						 + "{\"character\":"+ word2 +",\"id\":1,\"influence\":25,\"zone\":2},"
//						 + "{\"character\":"+ word3 +",\"id\":2,\"influence\":25,\"zone\":3},"
//						 + "{\"character\":"+ word4 +",\"id\":3,\"influence\":25,\"zone\":4},"
//						 + "{\"character\":"+ word5 +",\"id\":4,\"influence\":20,\"zone\":5},"
//						 + "{\"character\":"+ word6 +",\"id\":5,\"influence\":20,\"zone\":6},"
//						 + "{\"character\":"+ word7 +",\"id\":6,\"influence\":20,\"zone\":7},"
//						 + "{\"character\":"+ word8 +",\"id\":7,\"influence\":15,\"zone\":8},"
//						 + "{\"character\":"+ word9 +",\"id\":8,\"influence\":15,\"zone\":9},"
//						 + "{\"character\":"+ word10+",\"id\":9,\"influence\":15,\"zone\":10}],\"links\":[{\"source\":0,\"target\":2,\"weight\":5},{\"source\":0,\"target\":1,\"weight\":5},{\"source\":0,\"target\":3,\"weight\":5},{\"source\":0,\"target\":4,\"weight\":5},{\"source\":0,\"target\":5,\"weight\":5},{\"source\":0,\"target\":6,\"weight\":5},{\"source\":0,\"target\":7,\"weight\":5},{\"source\":0,\"target\":8,\"weight\":5},{\"source\":0,\"target\":9,\"weight\":5}]}";
//		byte[] by = str.getBytes();
//		output.write(by);
//		Thread.sleep(3000);
//		System.out.println("json 문서 작성 완료");
		
		return "test/d3jstest03";
	}
	
	@GetMapping("d3jstest04.do")
	public String d3jsTest04() {
		return "test/d3jstest04";
	}
	
	@GetMapping("d3jstest05.do")
	public String d3jsTest05() {
		return "test/d3jstest05";
	}
}
