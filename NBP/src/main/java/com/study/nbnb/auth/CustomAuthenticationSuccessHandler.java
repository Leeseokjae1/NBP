package com.study.nbnb.auth;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.study.nbnb.dao.BuserDao;
import com.study.nbnb.dto.BuserDto;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Configuration
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
    private BuserDao buserDao;
	
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException  {
	 	

        String username = authentication.getName();
        BuserDto login = buserDao.loginDao(username);
        
        HttpSession session = request.getSession();
        session.setAttribute("login", login);
        
        request.getRequestDispatcher("/main").forward(request, response);
        
    }
}
