package com.study.nbnb.auth;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import jakarta.servlet.DispatcherType;

@Configuration
public class WebSecurityConfig {
	
	@Autowired
	public AuthenticationFailureHandler authenticationFailureHandler;

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf((csrf) -> csrf.disable())
			.cors((cors) -> cors.disable())
			.authorizeHttpRequests(request -> request
				.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
				.requestMatchers("/").permitAll()
				.requestMatchers("/css/**","/js/**","/img,**").permitAll()
				.requestMatchers("/joinView").permitAll()
				.requestMatchers("/userJoin").permitAll()
				.requestMatchers("/list").permitAll()
				.requestMatchers("/list").permitAll()
				.requestMatchers("/api/emailCheck").permitAll()
				.requestMatchers("/member/**").hasAnyRole("0","1")
				.requestMatchers("/admin/**").hasAnyRole("0")
				.anyRequest().authenticated()	
			);
		
		http.formLogin((formLogin) -> formLogin
			.loginPage("/loginView")
			.loginProcessingUrl("/j_spring_security_check")
			.failureHandler(authenticationFailureHandler)
			.usernameParameter("id")
			.passwordParameter("password")
			.permitAll());
		
		http.logout((logout) ->logout
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.permitAll());
		
		return http.build();
	}
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication()
			.dataSource(dataSource)
			.usersByUsernameQuery("select id as userName, password, 1 as enabled"
								+ " from buser where id = ?")
			.authoritiesByUsernameQuery("select id as userName, bbang as authority"
										+ " from buser where id = ?")
			.passwordEncoder(new BCryptPasswordEncoder());
	}
}
