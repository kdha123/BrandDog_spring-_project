package com.branddog.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
//import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;


public class TravelPythonConnectUtil {
	
	static String result;
	
	public static String executePython(ServletContext sc,
			String keyowrds, String startDate, String endDate, String timeUnit, String gender, String[] ages, String check) throws Exception {
		String strNo = "";

		// command 조립
		String python = "python ";

		String rootPath = sc.getRealPath("/data/python/travel/");
		System.out.println("rootPath : " + rootPath);

		String fileName = "dataCollection.py";
		String execute = rootPath + fileName;
		System.out.println("execute : " + execute);
		
		List<String> commandData = new ArrayList<String>();
		// 넘길 데이터 조립
		String title = " 여행";
		
		String keywords = keyowrds; // '속초, 강릉'으로 넘어온다면?
		String[] key = keywords.trim().split(",");

		for (String str : key) {
			commandData.add(str.trim());
		}
		for(String str : ages) {
			commandData.add(str);
		}

		int cnt = commandData.size() + 8;

//		String[] command = new String[] {"python ", execute, title, sDate, eDate, timeUnit, gender, keyword, age};
		String[] command = new String[cnt];
		
		for (int i = 0; i < cnt; i++) {
			if (i == 0) {
				System.out.println("파이썬 들어가는 i : " + i);
				command[0] = python;
				System.out.println(python);
			} else if (i == 1) {
				System.out.println("execute 들어가는 i : " + i);
				command[1] = execute;
				System.out.println(execute);
			} else if (i == 2) {
				System.out.println("check 들어가는 i : " + i);
				command[2] = check;
				System.out.println(check);
			} else if (i == 3) {
				System.out.println("title 들어가는 i : " + i);
				command[3] = title;
				System.out.println(title);
			} else if (i == 4) {
				System.out.println("startDate 들어가는 i : " + i);
				command[4] = startDate;
				System.out.println(startDate);
			} else if (i == 5) {
				System.out.println("endDate 들어가는 i : " + i);
				command[5] = endDate;
				System.out.println(endDate);
			} else if (i == 6) {
				System.out.println("timeUnit 들어가는 i : " + i);
				command[6] = timeUnit;
				System.out.println(timeUnit);
			} else if (i == 7) {
				System.out.println("gender 들어가는 i : " + i);
				command[7] = gender;
				System.out.println(gender);
			} else {
				System.out.println("keyword 들어가는 i : " + i);
				command[i] = commandData.get(i - 8);
				System.out.println(commandData.get(i - 8));
			}
		}

		// commnd 확인
		System.out.println();
		for (String c : command) {
			System.out.println("****** command : " + c);
		}

		ProcessBuilder builder = new ProcessBuilder(command);
	    
	    try {
	    	Process p = builder.start();
		    
		    BufferedReader stdOut = new BufferedReader(new InputStreamReader(p.getInputStream()));
		    BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));
		    
		    while((result = stdOut.readLine()) != null){
		    	System.out.println("****** result : " + result);
		    	if(result.indexOf("no") >= 0) {
		    		strNo = result;
		    	}
		    }

		    while((result = stdError.readLine()) != null){
		    	System.out.println(result);
		    }
		    
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	    
	    System.out.println("TravelPythonConnectUtil.executePython().strNo : " + strNo);
	    
	    return strNo;
	    
	} // end of executePython()
}
