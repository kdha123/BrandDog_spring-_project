package com.branddog.member.dto;

//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.test.context.ContextConfiguration;

import lombok.Data;

@Data
public class MemberDTO {

	private int no;
	private String id;
	private String pw;
	private String name;
	
	
}
