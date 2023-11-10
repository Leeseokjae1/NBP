package com.study.nbnb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.nbnb.dao.BuserDao;
import com.study.nbnb.dto.BuserDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class NBController {

	@Autowired
	BuserDao buserDao;
	
	@RequestMapping("/")
	   public @ResponseBody String root() throws Exception {
	      return "test 사용하기";
	}
	
	@RequestMapping("/joinView")
	public String joinView() {
		return "login/join_view";
	}
	
	@RequestMapping("/userJoin")
	public String userJoin(HttpServletRequest request) {
		String PHONENUMBER = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		
		
		String encoded=PasswordEncoderFactories.createDelegatingPasswordEncoder().encode(request.getParameter("PASSWORD"));
		String password = encoded.substring(8);
		
		buserDao.writeDao(request.getParameter("NAME"),
						 request.getParameter("ID"),
						 password,
						 request.getParameter("ADDRESS"),
						 request.getParameter("EMAIL"),
						 PHONENUMBER,
						 request.getParameter("NICKNAME"),
						 request.getParameter("BBANG"));
		return "redirect:loginView";
	}
	
	@RequestMapping("/loginView")
	public String loginView() {
		return "login/login_view";
	}
	
	@RequestMapping("/mailView")
	public String mailView() {
		return "login/mail";
	}

}

