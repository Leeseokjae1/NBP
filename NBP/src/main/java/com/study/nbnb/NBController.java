package com.study.nbnb;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
		return "/login/join_view";
	}
	
	@RequestMapping("/userJoin")
	public String userJoin(HttpServletRequest request) {
		String PHONENUMBER = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		int BBANG = Integer.parseInt(request.getParameter("BBANG"));
		buserDao.writeDao(request.getParameter("NAME"),
						 request.getParameter("ID"),
						 request.getParameter("PASSWORD"),
						 request.getParameter("ADDRESS"),
						 request.getParameter("EMAIL"),
						 PHONENUMBER,
						 request.getParameter("NICKNAME"),
						 BBANG);
		return "redirect:loginView";
	}
	
	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest request) {
		return "/login/login_view";
	}
	
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request) {

		List<BuserDto> users = buserDao.loginDao(request.getParameter("ID"), request.getParameter("PASSWORD"));
	    // 결과 세트의 크기를 확인합니다.
	    if (users.size() == 0) {
	    	// 검색 결과가 없습니다.
	    	return "redirect:loginView?result=1";
	    }
		return "redirect:/";
	}
}