
package com.study.nbnb;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.nbnb.dao.B1Dao;
import com.study.nbnb.dao.CommentDao;
import com.study.nbnb.dao.LikeDao;
import com.study.nbnb.dao.PlayDao;
import com.study.nbnb.dto.LikeDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class NBController {

	@Autowired
	B1Dao dao;
	@Autowired
	PlayDao playdao;
	@Autowired
	CommentDao cmtdao;
	@Autowired
	LikeDao likedao;
	
	@RequestMapping("/")
    public String root() throws Exception {
       return "redirect:playlist";
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
	
	@RequestMapping("/playlist")
	public String playlistpage(Model model) {
		model.addAttribute("playlist", playdao.plistDao());
		return "/playboard/playlist";
	}
	
	@RequestMapping("/playview")
	public String playview(HttpServletRequest request, Model model) {
		int f_number = Integer.parseInt(request.getParameter("f_number"));
		int check_b = Integer.parseInt(request.getParameter("check_b"));
		model.addAttribute("playview", playdao.viewDao(f_number));
		model.addAttribute("commentview", cmtdao.viewDao(check_b, f_number));
		return "/playboard/playview";
	}
	
	@RequestMapping("/replywrite")
	public String playcmtstore(HttpServletRequest request, Model model) {
		
		int check_b = Integer.parseInt(request.getParameter("check_b"));
		int m_number = Integer.parseInt(request.getParameter("m_number"));
		int t_number = Integer.parseInt(request.getParameter("t_number"));

		cmtdao.writeDao(check_b,
				 m_number,
				 request.getParameter("nickname"),				
				 request.getParameter("cmt"),				 
				 t_number);

	return "redirect:playview?f_number="+request.getParameter("t_number")+"&check_b=3";
	}
	
	@RequestMapping("/replydelete")
	public String replydelete(HttpServletRequest request, Model model) {
		int t_number = Integer.parseInt(request.getParameter("t_number"));
		int c_number =Integer.parseInt(request.getParameter("c_number"));
		cmtdao.deleteDao(c_number);
		return "redirect:playview?f_number="+request.getParameter("t_number")+"&check_b=3";
		
	}	
	

	@RequestMapping("/playwriteform")
	public String playwriteForm() {
		return "/playboard/playwriteform";
	}
	
	@RequestMapping("/playwrite")
	public String playwrite(HttpServletRequest request, Model model) {
		playdao.writeDao(request.getParameter("writer"),
					 request.getParameter("title"),
					 request.getParameter("content"));
	
		return "redirect:playlist";
	}
	 
	
	@RequestMapping("/playmodifyview")
	public String playmodifyview(HttpServletRequest request, Model model) {
		int pId = Integer.parseInt(request.getParameter("f_number"));
		model.addAttribute("playmodify", playdao.viewDao(pId));
		return "/playboard/playmodify";
	}
	
	
	@RequestMapping("/playmodify")
	public String playmodify(HttpServletRequest request, Model model) {
		int f_number = Integer.parseInt(request.getParameter("f_number"));
		model.addAttribute("playmodify", playdao.modifyDao(request.getParameter("writer"),
														 request.getParameter("title"),
														 request.getParameter("content"),
														 f_number));
		return "redirect:playview?f_number="+request.getParameter("f_number")+"&check_b=3";
	}
	
	@RequestMapping("/playdelete")
	public String playdelete(HttpServletRequest request, Model model) {
		int f_number =Integer.parseInt(request.getParameter("f_number"));
		playdao.deleteDao(f_number);
		return "redirect:playlist";
	}	
	
	@RequestMapping("/playlike")
	public String playlike(HttpServletRequest request, Model model) {
		int check_b =Integer.parseInt(request.getParameter("check_b"));
		int t_number =Integer.parseInt(request.getParameter("t_number"));
		int m_number =Integer.parseInt(request.getParameter("m_number"));
		int l_or_dl = Integer.parseInt(request.getParameter("l_or_dl"));

		List<LikeDto> list =likedao.listDao(check_b, t_number, m_number); 
		
		if(list.size() == 0) {
			likedao.clickDao(check_b, t_number, m_number, l_or_dl); 
			playdao.likelyDao(t_number);
			
		}else {
			likedao.deleteDao(check_b, t_number, m_number); 
			playdao.likeDropDao(t_number);
		}
			
		return "redirect:playview?f_number="+request.getParameter("t_number")+"&check_b=3";
		
	}
	
}