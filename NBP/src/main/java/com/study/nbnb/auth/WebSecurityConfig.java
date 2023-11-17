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
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.study.nbnb.oauth2.CustomOAuth2UserService;

import jakarta.servlet.DispatcherType;

@Configuration
public class WebSecurityConfig {
	
	@Autowired
	public AuthenticationFailureHandler authenticationFailureHandler;
	@Autowired
	public AuthenticationSuccessHandler authenticationSuccessHandler;
	@Autowired
	public CustomOAuth2UserService customOAuth2UserService;
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf((csrf) -> csrf.disable())
			.cors((cors) -> cors.disable())
			.authorizeHttpRequests(request -> request
				.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
				.requestMatchers("/").permitAll()
				.requestMatchers("/css/**","/js/**","/img/**").permitAll()
				.requestMatchers("/joinView").permitAll()
				.requestMatchers("/userJoin").permitAll()
				.requestMatchers("/search_id").permitAll()
				.requestMatchers("/search_pw").permitAll()
				.requestMatchers("/pwUpdate").permitAll()
				.requestMatchers("/api/**").permitAll()
				.requestMatchers("/1/**").permitAll()
				.requestMatchers("/main**").permitAll()
				.requestMatchers("/b1**").permitAll()
				.requestMatchers("/b2**").permitAll()
				.requestMatchers("/play**").permitAll()
				.requestMatchers("member/**").hasAnyRole("0","1","3")
				.requestMatchers("/admin/**").hasAnyRole("0")
				.anyRequest().authenticated()	
			);
		
		http.formLogin((formLogin) -> formLogin
			.loginPage("/loginView")
			.loginProcessingUrl("/j_spring_security_check")
			.failureHandler(authenticationFailureHandler)
			.successHandler(authenticationSuccessHandler)
			.usernameParameter("id")
			.passwordParameter("password")
			.permitAll());
		
		http.logout((logout) ->logout
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.permitAll());
		
		http.headers((headers) -> headers
				.frameOptions(frameOptions -> frameOptions.disable())
		);
		
		http.oauth2Login((oauth) -> oauth
				.userInfoEndpoint(endPoint -> endPoint
						.userService(customOAuth2UserService)
				)
		);
		
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
