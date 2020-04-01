package com.branddog.util;

import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

public class SearchConnectPythonUtill {
	
	public static void connectPython(ServletContext c, String startDate, String endDate, String timeUnit, String gender, String[] ages, String[] keywords) throws Exception {
		String python = "python ";
		
		String rootPath = c.getRealPath("/data/python/culture/");
		System.out.println("rootPath : " + rootPath);
		
		String fileName = "naver_dataLab.py";
		String execute = rootPath + fileName;
		System.out.println("execute : " + execute);
		
		List<String> keyage = new ArrayList<String>();
//		
		for(String key : ages) {
			keyage.add(key);
		}
		for(String key : keywords) {
			keyage.add(key);
		}
		
		int cnt = keyage.size() + 6;
		
//		String[] command = new String[] {"python ", execute, title};
		String[] command = new String[cnt];
		
		for(int i = 0; i < cnt; i++) {
			if(i == 0) {
				System.out.println("파이썬 들어가는 i : " + i);
				command[0] = python;
				System.out.println(python);
			} else if(i == 1) {
				System.out.println("execute 들어가는 i : " + i);
				command[1] = execute;
				System.out.println(execute);
			} else if(i == 2) {
				System.out.println("startDate 들어가는 i : " + i);
				command[2] = startDate;
				System.out.println(startDate);
			} else if(i == 3) {
				System.out.println("endDate 들어가는 i : " + i);
				command[3] = endDate;
				System.out.println(endDate);
			} else if(i == 4) {
				System.out.println("timeUnit 들어가는 i : " + i);
				command[4] = timeUnit;
				System.out.println(timeUnit);
			} else if(i == 5) {
				System.out.println("gender 들어가는 i : " + i);
				command[5] = gender;
				System.out.println(gender);
			} else {
				System.out.println("keyword 들어가는 i : " + i);
				command[i] = keyage.get(i - 6);
				System.out.println(keyage.get(i - 6));
			}
		}
		
		System.out.println();
		
		for(String cmd : command) {
			System.out.println(cmd);
		}
		
		ProcessBuilder builder = new ProcessBuilder(command);
//		Process process = builder.start();
		
		builder.redirectOutput(Redirect.INHERIT);
	    builder.redirectError(Redirect.INHERIT);
	    
	    printStream(builder.start());
	    
	}
	public static void wordPython(ServletContext c, String[] keywords) throws Exception {
		String python = "python ";

		String rootPath = c.getRealPath("/data/python/culture/");
		System.out.println("rootPath : " + rootPath);

		String fileName = "culture_reword.py";
		String execute = rootPath + fileName;
		System.out.println("execute : " + execute);

		String title = "문화";

		List<String> keyword = new ArrayList<String>();

		for (String str : keywords) {
			keyword.add(str.trim());
		}

		int cnt = keyword.size() + 3;

//		String[] command = new String[] {"python ", execute, title};
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
				System.out.println("타이틀 들어가는 i : " + i);
				command[2] = title;
				System.out.println(title);
			} else {
				System.out.println("keyword 들어가는 i : " + i);
				command[i] = keyword.get(i - 3);
				System.out.println(keyword.get(i - 3));
			}
		}

		System.out.println();

		for (String cmd: command) {
			System.out.println(cmd);
		}

		ProcessBuilder builder = new ProcessBuilder(command);
	    
	    Process p = builder.start();
	    printStream(p);
	    
	}
	
	private static void printStream(Process process)throws Exception{
		process.waitFor();
		try (InputStream psout = process.getInputStream()) {
            copy(psout, System.out);
		}
	}
	
	 private static void copy(InputStream input, OutputStream output) throws Exception {
        byte[] buffer = new byte[1024];
        int n = 0;
        while ((n = input.read(buffer)) != -1) {
            output.write(buffer, 0, n);
        }
	 }
}
