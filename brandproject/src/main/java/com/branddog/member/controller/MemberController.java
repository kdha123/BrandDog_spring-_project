package com.branddog.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.branddog.member.dto.MemberDTO;
import com.branddog.member.sevice.MemberServiceImpl;
import com.branddog.util.page.PageObject;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member")
@AllArgsConstructor
@ContextConfiguration({"file:/src/main/webapp/WEB-INF/spring/root-context.xml",
	"/src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberController {

	private MemberServiceImpl memberService;
	
	private PasswordEncoder pwencoder;
	
	private final String module = "member";
	
	@PostMapping("/list.do")
	public String list(Model model, PageObject pageObject) {
		
		model.addAttribute("list", memberService.list());
		model.addAttribute("pageObject", pageObject);
		
		return module + "/list";
	}
	
	@GetMapping("/join.do")
	public String join() {
		
		return module + "/join";
	}
	
	@PostMapping("/join.do")
	public String join(MemberDTO dto) {
		
//		System.out.println("memberController.join().dto" + dto);
		dto.setPw(pwencoder.encode(dto.getPw()));
		memberService.join(dto);
		
		return module + "/welcome";
	}
	
	@GetMapping("/login.do")
	public String login(MemberDTO dto) {
		
		return module + "/login";
	}
	
	@PostMapping("/login.do")
	public String login(MemberDTO dto, HttpSession session, Model model) {
		
		String rawPassword = dto.getPw();
		String encodedPassword = memberService.login(dto).getPw();
		
		boolean answer = pwencoder.matches(rawPassword, encodedPassword);
		
		System.out.println("-------------" + answer);
		
		MemberDTO logindto = memberService.login(dto);
		logindto.setPw("");
		
//		dto.setPw("");
		
		if(answer == true) {
			System.out.println("-----first-----" + dto); 
			session.setAttribute("login", logindto);
			System.out.println("-----after-----" + session.getAttribute("login"));
			String uri =(String) session.getAttribute("uri");
			session.removeAttribute("uri");
			return (uri == null)? "redirect:/":
				"redirect:"+uri;
			}
		else 
			model.addAttribute("loginMessage", 1);
			return module + "/login";
	}
	// 7.로그아웃처리
		@GetMapping("/logout.do")
		public String logout(HttpSession session) {
			// session을 지운다.
			session.invalidate();
			return "redirect:/";
		}
}
