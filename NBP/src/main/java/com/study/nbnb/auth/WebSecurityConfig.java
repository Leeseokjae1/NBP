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
				.requestMatchers("/admin/**").hasAnyRole("0")
				.requestMatchers("/member/b1write").hasAnyRole("0","1")
				.requestMatchers("/member/b1writeform").hasAnyRole("0","1")
				.requestMatchers("/cancelPurchase").hasAnyRole("0","1","2","3")
				.requestMatchers("/fail").hasAnyRole("0","1","2","3")
				.requestMatchers("/getTicketCount").hasAnyRole("0","1","2","3")
				.requestMatchers("/mailView").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b1delete").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b1like").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b1modify").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b1modifyform").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b1replydelete").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b1replywrite").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b2delete").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b2like").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b2modify").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b2modifyform").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b2replydelete").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b2replywrite").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/playdelete").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/playlike").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/playmodify").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/playmodifyview").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/playwrite").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/playwriteform").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/plreplywrite").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/replydelete").hasAnyRole("0","1","2","3")
				.requestMatchers("/mypage").hasAnyRole("0","1","2","3")
				.requestMatchers("/playlist").hasAnyRole("0","1","2","3")
				.requestMatchers("/shopping_list").hasAnyRole("0","1","2","3")
				.requestMatchers("/success").hasAnyRole("0","1","2","3")
				.requestMatchers("/ticketuse").hasAnyRole("0","1","2","3")
				.requestMatchers("/member/b2write").hasAnyRole("0","2")
				.requestMatchers("/member/b2writeform").hasAnyRole("0","2")
				.requestMatchers("/").permitAll()
				.requestMatchers("/1/profile").permitAll()
				.requestMatchers("/1/profile/modify").permitAll()
				.requestMatchers("/api/**").permitAll()
				.requestMatchers("/css/**","/js/**","/img/**").permitAll()
				.requestMatchers("/goodpost").permitAll()
				.requestMatchers("/joinView").permitAll()
				.requestMatchers("/loginView").permitAll()
				.requestMatchers("/main").permitAll()
				.requestMatchers("/map").permitAll()
				.requestMatchers("/member/b1page").permitAll()
				.requestMatchers("/member/b1view").permitAll()
				.requestMatchers("/member/b2page").permitAll()
				.requestMatchers("/member/b2view").permitAll()
				.requestMatchers("/member/playpage").permitAll()
				.requestMatchers("/member/playview").permitAll()
				.requestMatchers("/mpchat").permitAll()
				.requestMatchers("/mypage_popup").permitAll()
				.requestMatchers("/mypage_shop").permitAll()
				.requestMatchers("/rpage").permitAll()
				.requestMatchers("/search_id").permitAll()
				.requestMatchers("/search_pw").permitAll()
				.requestMatchers("/uploads/**","/upload/**","/image/**").permitAll()
				.requestMatchers("/userJoin").permitAll()
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
