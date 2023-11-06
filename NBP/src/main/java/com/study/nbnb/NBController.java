package com.study.nbnb;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.nbnb.dao.B1Dao;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class NBController {

	@Autowired
	B1Dao dao;
	
	@RequestMapping("/")
	public String root() throws Exception{
		//MyBatis : SimpleBBS
		return "redirect:list";
	}
	
	@RequestMapping("/list")
	public String userlistpage(Model model) {
		model.addAttribute("list", dao.listDao());
		return "/b1board/b1list";
	}
	
	@RequestMapping("/b1view")
	public String view(HttpServletRequest request, Model model) {
		String sId = request.getParameter("id");
		model.addAttribute("dto", dao.viewDao(sId));
		return "/b1board/b1view";
	}
	
	@RequestMapping("/b1writeform")
	public String writeForm() {
		return "/b1board/b1writeform";
	}
	
	@RequestMapping("/b1write")
	public String write(HttpServletRequest request, Model model) {
		dao.writeDao(request.getParameter("writer"),
					 request.getParameter("title"),
					 request.getParameter("content"));
		return "redirect:list";
	}
	
	@RequestMapping("/b1delete")
	public String delete(HttpServletRequest request, Model model) {
		dao.deleteDao(request.getParameter("id"));
		return "redirect:list";
	}
}