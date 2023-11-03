package com.net.board.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.net.board.dto.MemberDTO;
import com.net.board.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("/login")
	public String login(
					@RequestParam(value = "error", required = false)String error,
					@RequestParam(value = "exception", required = false)String exception,
					Model model, Authentication authentication){
		
		log.info(error);
		log.info(exception);
		
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		
		// 로그인정보가 있으면 메인으로 돌아가기
		if(authentication != null) {
			return"redirect:list";
		}
		
//		String password3 = "123";
//		System.out.println("비밀번호 : " + password3);
//		String enPw = passwordEncoder.encode(password3);
//		System.out.println("암호화된 비밀번호 : " + enPw);
		
		return "/login/cLogin";
		
	}
	
	@GetMapping("/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
		return "redirect:/login";
	}
	
	
	
	@GetMapping("/sign")
	public String sign() {
		return "/login/sign";
	}
	
	@ResponseBody
	@PostMapping("/sign")
	public String signOk(@ModelAttribute("dto")MemberDTO dto
						,HttpServletResponse rs
						,@RequestParam("username")String id
						,@RequestParam("password")String password
						,@RequestParam("nickname")String nickname) throws IOException {
		passwordEncoder = new BCryptPasswordEncoder();

		log.info("id:" + id + " password " + password + " nickname:" + nickname);
		dto.setId(id);
		dto.setPassword(passwordEncoder.encode(password)); // password 암호화후 저장
		dto.setNickname(nickname);
		
		int resultId = service.checkId(dto); // id 중복 체크
		int resultName = service.checkName(dto); // nickname 중복 체크
		
		if (resultId == 0 && resultName == 0) {
			log.info("중복 없음");
			service.insertOne(dto);
		}else if (resultId > 0 && resultName > 0) {
			log.info("둘다 중복");
			return "<script>alert('아이디 & 닉네임 중복입니다.'); history.go(-1);</script>";
		}else if (resultName > 0 ) {
			log.info("nickname 중복 확인");
			return "<script>alert('닉네임 중복입니다.'); history.go(-1);</script>";
		}else if (resultId > 0 ) {
			log.info("id중복 확인");
			return "<script>alert('아이디 중복입니다.'); history.go(-1);</script>";
		}
		
		return "<script>alert('가입성공'); location.href='login';</script>";
	}
		
	
	

}
