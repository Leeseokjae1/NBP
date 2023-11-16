package com.study.nbnb.oauth2;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.study.nbnb.dao.BuserDao;
import com.study.nbnb.dto.BuserDto;

import jakarta.servlet.http.HttpSession;

@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
	@Autowired
	private HttpSession httpSession;
	@Autowired
	BuserDao buserDao;
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		OAuth2UserService delegate = new DefaultOAuth2UserService();
		OAuth2User oAuth2User = delegate.loadUser(userRequest);

		String registrationId = userRequest.getClientRegistration().getRegistrationId();
		String userNameAttributeName = userRequest.getClientRegistration()
				                                  .getProviderDetails()
				                                  .getUserInfoEndpoint()
				                                  .getUserNameAttributeName();

		OAuthAttributes attributes = OAuthAttributes.of(registrationId,
				                                        userNameAttributeName,
				                                        oAuth2User.getAttributes());
		
		String name = attributes.getName();
		String email = attributes.getEmail();
		String ROLE = "ROLE_4";
		BuserDto user = buserDao.emailDao(email);
		
		if(user.getEMAIL() == null) {
			buserDao.writeDao(name,email, "","",email," ",name,"ROLE_3");
			
			user = buserDao.emailDao(email);
		} else {
			ROLE = user.getBBANG();
		}
		
		
		httpSession.setAttribute("login", user);
		
		return new DefaultOAuth2User(Collections.singleton(new SimpleGrantedAuthority(ROLE)),
				                     attributes.getAttributes(),
				                     attributes.getNameAttributeKey());
	}
}