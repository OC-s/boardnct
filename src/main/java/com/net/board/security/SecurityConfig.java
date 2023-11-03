package com.net.board.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.net.board.dto.MemberDTO;
import com.net.board.service.MemberService;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;
	
	@Autowired
	MemberService service;
	
	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	private final AuthenticationFailureHandler customFailureHandler;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		final String idQuery = "SELECT id as username, password, enabled from member where id = ?";
		final String authQuery = "SELECT id as username, role as authority from member WHERE id = ?";
		
		auth.jdbcAuthentication()
			.dataSource(dataSource)
			.usersByUsernameQuery(idQuery)
			.authoritiesByUsernameQuery(authQuery)
			.passwordEncoder(passwordEncoder());
	}

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
			.authorizeHttpRequests()
			.antMatchers("/sign", "/login").permitAll()
			.anyRequest().authenticated() // 모든접근 인증필요 로그인 
		.and()
		.formLogin()
			.loginPage("/login")
			.loginProcessingUrl("/login")
			.usernameParameter("username")
			.passwordParameter("password")
			.successHandler(new AuthenticationSuccessHandler() {
				@Override
				public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
						Authentication authentication) throws IOException, ServletException {
					
					HttpSession session = request.getSession();
					MemberDTO dto = service.getIdOne(authentication.getName());
					session.setMaxInactiveInterval(7200);
					session.setAttribute("dto", dto);
					response.sendRedirect("/");
				}
			})
			.failureHandler(customFailureHandler) // 로그인 실패 핸들러
			.permitAll()
		.and()
		.logout()
			.logoutSuccessUrl("/login")  // 로그아웃 성공시 이동할 url
			.invalidateHttpSession(true) // 로그아웃 성공시 세션제거 (정상작동 안함 httpSessionEventPublisher 메소드추가)
			.deleteCookies("JSESSIONID") // 쿠키제거
		.and()
		.sessionManagement()
			.maximumSessions(1)				// 세션 허용 갯수 (1)개 
			.maxSessionsPreventsLogin(false)
			.expiredUrl("/login");			// 세션 만료시 이동페이지
			
	}
	
	
	

}
