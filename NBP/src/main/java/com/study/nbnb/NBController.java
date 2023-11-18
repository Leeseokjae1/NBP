package com.study.nbnb;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nimbusds.jose.shaded.gson.Gson;
import com.study.nbnb.dao.B1Dao;
import com.study.nbnb.dao.B2Dao;
import com.study.nbnb.dao.BuserDao;
import com.study.nbnb.dao.CommentDao;
import com.study.nbnb.dao.LikeDao;
import com.study.nbnb.dao.PlayDao;
import com.study.nbnb.dto.B1Dto;
import com.study.nbnb.dto.B2Dto;
import com.study.nbnb.dto.BuserDto;
import com.study.nbnb.dto.LikeDto;
import com.study.nbnb.dto.PlayDto;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class NBController {

	@Autowired
	B1Dao b1dao;
	@Autowired
	B2Dao b2dao;
	@Autowired
	PlayDao playdao;
	@Autowired
	CommentDao cmtdao;
	@Autowired
	LikeDao likedao;
	@Autowired
	BuserDao buserDao;

    @Value("${upload.directory}")
    private String uploadDirectory;
	
	@RequestMapping("/")
	public String root() throws Exception{
		//MyBatis : SimpleBBS
		return "redirect:main";
	}
	@RequestMapping("/test")
	public String test(Model model){
		List<BuserDto> myList = buserDao.listDao();
		String myListJson = new Gson().toJson(myList);
		model.addAttribute("list", myListJson);
		
		return "test";
	}
	
	@RequestMapping("1/mypage")
	public String mypageview(){
		return "mypage/mypage_view";
	}
	
	@RequestMapping("/bbangrank")
	public String bbangRankview(){
		return "bbang_rank";
	}
	
	@RequestMapping("/main")
	public String mainview(){
		return "main_view";
	}
	
	@RequestMapping("/mpchat")
	public String myPageChatview(){
		return "/mypage/mypage_talk";
	}
	
	@RequestMapping("/list")
	public String userlistpage(Model model) {
		model.addAttribute("list", b1dao.listDao());
		return "b1board/b1list";
	}
	
	////////////////////////////////////LogIn////////////////////////////////////////////////////////////
	@RequestMapping("/admin")
	public String sLogin_popup() {
		return "adminboard/adminbd";
	}
	@RequestMapping("/admin/member")
	public String admin_member(HttpServletRequest request, Model model) {
		String field = request.getParameter("Searchfield");
		String search = request.getParameter("Search");
		int total=0;
		if(search == null) {
			total = buserDao.listDao().size();
		} else {
			total = buserDao.searchUser(field, search).size();
		}
		 
	    int pageSize = 10;

	    int totalPage = total / pageSize;

	    if (total % pageSize > 0) {
	         totalPage++;
	    }
	    
	    String sPage = request.getParameter("page");
	    int page = sPage == null ? 1 : Integer.parseInt(sPage);
	    int nStart = (page - 1) * pageSize + 1;
	    int nEnd = (page - 1) * pageSize + pageSize;
	    
	    List<BuserDto> list;
	    
	    if(field == null) {
	    	list = buserDao.pageDao(nEnd, nStart);
		} else {
			list = buserDao.pSU(field, search, nEnd, nStart);
		}
	    
	    model.addAttribute("field", field);
	    model.addAttribute("search", search);
	    model.addAttribute("userList", list);
	    model.addAttribute("totalPage", totalPage);
	    model.addAttribute("page", page);

		return "adminboard/adminmember";
	}
	
	@RequestMapping("/admin/member_profile")
	public String member_modify(HttpServletRequest request, Model model) {
		int m_number = Integer.parseInt(request.getParameter("m_number"));
		model.addAttribute("user", buserDao.selectUser(m_number));
		return "adminboard/adminmember_profile";
	}
	
	@RequestMapping("/admin/member_modify")
	public String member_modify(HttpServletRequest request) {
		try {
			int m_number = Integer.parseInt(request.getParameter("M_NUMBER"));
			String PHONENUMBER = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
			
			String dateString = request.getParameter("S_DATE");
			String pattern = "yyyy-MM-dd HH:mm:ss";
			
		    SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		    Date parsedDate = dateFormat.parse(dateString);
			    
		    Timestamp S_DATE = new Timestamp(parsedDate.getTime());
	        
		            
			if(request.getParameter("PASSWORD").equals(request.getParameter("pw"))) {
				buserDao.updateUser3(
						request.getParameter("ID"), 
						request.getParameter("NAME"), 
						request.getParameter("ADDRESS"), 
						request.getParameter("EMAIL"), 
						PHONENUMBER, 
						request.getParameter("NICKNAME"), 
						request.getParameter("BBANG"), 
						request.getParameter("S_COMMENT"), 
						S_DATE, 
						m_number
					);
			} else {
				String encoded=PasswordEncoderFactories.createDelegatingPasswordEncoder().encode(request.getParameter("PASSWORD"));
				String password = encoded.substring(8);
				
				buserDao.updateUser4(
						request.getParameter("ID"), 
						password,
						request.getParameter("NAME"), 
						request.getParameter("ADDRESS"), 
						request.getParameter("EMAIL"), 
						PHONENUMBER, 
						request.getParameter("NICKNAME"), 
						request.getParameter("BBANG"), 
						request.getParameter("S_COMMENT"), 
						S_DATE, 
						m_number
					);
				
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/admin/member?page=1";
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
		String bbang = request.getParameter("BBANG");
		buserDao.writeDao(request.getParameter("NAME"),
						 request.getParameter("ID"),
						 password,
						 request.getParameter("ADDRESS"),
						 request.getParameter("EMAIL"),
						 PHONENUMBER,
						 request.getParameter("NICKNAME"),
						 bbang);
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
	
	@RequestMapping("/search_id")
	public String search_id() {
		return "login/search_id";
	}
	@RequestMapping("/search_pw")
	public String search_pw() {
		return "login/search_pw";
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	

	////////////////////////////////////mypage////////////////////////////////////////////////////////////
	@RequestMapping("/1/profile")
	public String profile(HttpServletRequest request, Model model) {
		int m_number = Integer.parseInt(request.getParameter("m_number"));
		model.addAttribute("user", buserDao.selectUser(m_number));
		return "mypage/mypage_profile";
	}
	
	@RequestMapping("/1/profile/modify")
	public String profile_modify(HttpServletRequest request) {
		int m_number = Integer.parseInt(request.getParameter("m_number"));
		
		String PHONENUMBER = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		
		String pw1 = request.getParameter("PASSWORD");
		String pw2 = request.getParameter("pw2");

		if (pw1.equals(pw2)) {
			buserDao.updateUser2(
					request.getParameter("ID"), 
					request.getParameter("NAME"), 
					request.getParameter("ADDRESS"), 
					request.getParameter("EMAIL"), 
					PHONENUMBER, 
					request.getParameter("NICKNAME"), 
					request.getParameter("BBANG"), 
					m_number);
		}else {
			String encoded=PasswordEncoderFactories.createDelegatingPasswordEncoder().encode(pw1);
			String password = encoded.substring(8);
			buserDao.updateUser(
					request.getParameter("ID"), 
					password, 
					request.getParameter("NAME"), 
					request.getParameter("ADDRESS"), 
					request.getParameter("EMAIL"), 
					PHONENUMBER, 
					request.getParameter("NICKNAME"), 
					request.getParameter("BBANG"), 
					m_number);
		}
		return "redirect:/";
	}
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/b1view")
	public String view(HttpServletRequest request, Model model) {
		int b1_number = Integer.parseInt(request.getParameter("b1_number"));
		int check_b = Integer.parseInt(request.getParameter("check_b"));
		model.addAttribute("dto", b1dao.viewDao(b1_number));
		model.addAttribute("commentview", cmtdao.viewDao(check_b, b1_number));
		return "/b1board/b1view";
	}
	
	@RequestMapping("/b1replywrite")
	public String b1CmtStore(HttpServletRequest request, Model model) {

		int check_b = Integer.parseInt(request.getParameter("check_b"));
		int m_number = Integer.parseInt(request.getParameter("m_number"));
		int t_number = Integer.parseInt(request.getParameter("t_number"));

		cmtdao.writeDao(check_b, m_number, request.getParameter("nickname"), request.getParameter("cmt"), t_number);

		return "redirect:/1/b1view?b1_number=" + request.getParameter("t_number") + "&check_b=1";
	}

	@RequestMapping("/b1replydelete")
	public String b1Delete(HttpServletRequest request, Model model) {
		int t_number = Integer.parseInt(request.getParameter("t_number"));
		int c_number = Integer.parseInt(request.getParameter("c_number"));
		cmtdao.deleteDao(c_number);
		return "redirect:b1view?b1_number=" + request.getParameter("t_number") + "&check_b=1";

	}
	
	@RequestMapping("/b1writeform")
	public String writeForm() {
		return "/b1board/b1writeform";
	}
	
	@RequestMapping("/b1write")
	public String write(
	    @RequestParam("file1") MultipartFile file1,
	    @RequestParam("file2") MultipartFile file2,
	    @RequestParam("file3") MultipartFile file3,
	    HttpServletRequest request, Model model) {
	    try {
	        String writer = request.getParameter("writer");
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");

	        String imageURL1 = uploadFile(file1);
	        String imageURL2 = uploadFile(file2);
	        String imageURL3 = uploadFile(file3);

	        b1dao.writeDao(writer, title, content, imageURL1, imageURL2, imageURL3);

	        return "redirect:list";
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:list";
	}

	private String uploadFile(MultipartFile file) throws IOException {
	    if (!file.isEmpty()) {
	        String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	        String filePath = Paths.get(uploadDirectory, fileName).toString();
	        Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
	        return "/uploads/" + fileName;
	    }
	    return null;
	}

	@RequestMapping("/b1modifyform")
	public String modifyForm(int b1_number, HttpServletRequest request, Model model) {
		//String b1_number = request.getParameter("b1_number");
		
		model.addAttribute("dto", b1dao.viewDao(b1_number));
		return "/b1board/b1modifyform";
	}
	
	@RequestMapping("/b1modify")
	public String modify(
	        @RequestParam("b1_number") int b1_number,
	        @RequestParam("file1") MultipartFile file1,
	        @RequestParam("file2") MultipartFile file2,
	        @RequestParam("file3") MultipartFile file3,
	        HttpServletRequest request, Model model) {
	        try {
	            String writer = request.getParameter("writer");
	            String title = request.getParameter("title");
	            String content = request.getParameter("content");

	            B1Dto existingDTO = b1dao.viewDao(b1_number);

	            String imageURL1 = file1.isEmpty() ? existingDTO.getImageurl1() : uploadFile(file1);
	            String imageURL2 = file2.isEmpty() ? existingDTO.getImageurl2() : uploadFile(file2);
	            String imageURL3 = file3.isEmpty() ? existingDTO.getImageurl3() : uploadFile(file3);
	            String b1_number1 = Integer.toString(b1_number);
	            
	            Map<String, String> parameters = new HashMap<>();
	            parameters.put("writer", writer);
	            parameters.put("title", title);
	            parameters.put("content", content);
	            parameters.put("imageurl1", imageURL1);
	            parameters.put("imageurl2", imageURL2);
	            parameters.put("imageurl3", imageURL3);
	            parameters.put("b1_number", b1_number1);

	            b1dao.modifyDao(parameters);

	            return "redirect:list";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "redirect:list";
	        }
	}
	
	@RequestMapping("/b1delete")
	public String delete(HttpServletRequest request, Model model) {
		b1dao.deleteDao(request.getParameter("b1_number"));
		return "redirect:list";
	}
	
	@RequestMapping("/b1like")
	public String b1Like(HttpServletRequest request, Model model) {
		int check_b = Integer.parseInt(request.getParameter("check_b"));
		int t_number = Integer.parseInt(request.getParameter("t_number"));
		int m_number = Integer.parseInt(request.getParameter("m_number"));
		int l_or_dl = Integer.parseInt(request.getParameter("l_or_dl"));
		List<LikeDto> list = likedao.listDao(check_b, t_number, m_number);
		List<LikeDto> list2 = likedao.listDao2(check_b, t_number, m_number, l_or_dl);

		if (list.size() == 0) {

			if (l_or_dl == 1) {
				likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
				b1dao.likelyDao(t_number);
			} else if (l_or_dl == -1) {
				likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
				b1dao.dislikelyDao(t_number);
			}
		} else {
			if (list2.size() == 0) {
				likedao.deleteDao(check_b, t_number, m_number);
				b1dao.dislikeDropDao(t_number);
				if (l_or_dl == 1) {
					likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
					b1dao.likelyDao(t_number);
				
				} 
			}else
			{
				likedao.deleteDao(check_b, t_number, m_number);
				b1dao.likeDropDao(t_number);
				if(l_or_dl ==-1) {
					likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
					b1dao.dislikelyDao(t_number);
				}
			}
		}
	
		return "redirect:b1view?b1_number=" + request.getParameter("t_number") + "&check_b=1";
	}

	
	//////////////////////////////b2 board///////////////////////////////////////////////////////////
	
	@RequestMapping("/b2list")
	public String b2list(Model model) {
		model.addAttribute("list", b2dao.listDao());
		return "/b2board/b2list";
	}
	

	@RequestMapping("/b2view")
	public String b2view(HttpServletRequest request, Model model) {
		int b2_number = Integer.parseInt(request.getParameter("b2_number"));
		int check_b = Integer.parseInt(request.getParameter("check_b"));
		model.addAttribute("dto", b2dao.viewDao(b2_number));
		model.addAttribute("commentview", cmtdao.viewDao(check_b, b2_number));
		return "/b2board/b2view";
		
	}
	
	@RequestMapping("/b2replywrite")
	public String b2CmtStore(HttpServletRequest request, Model model) {

		int check_b = Integer.parseInt(request.getParameter("check_b"));
		int m_number = Integer.parseInt(request.getParameter("m_number"));
		int t_number = Integer.parseInt(request.getParameter("t_number"));

		cmtdao.writeDao(check_b, m_number, request.getParameter("nickname"), request.getParameter("cmt"), t_number);

		return "redirect:b2view?b2_number=" + request.getParameter("t_number") + "&check_b=2";
	}


	
	
	
	
	@RequestMapping("/b2replydelete")
	public String b2Delete(HttpServletRequest request, Model model) {
		int t_number = Integer.parseInt(request.getParameter("t_number"));
		int c_number = Integer.parseInt(request.getParameter("c_number"));
		cmtdao.deleteDao(c_number);
		return "redirect:b2view?b2_number=" + request.getParameter("t_number") + "&check_b=2";

	}
	
	@RequestMapping("/b2writeform")
	public String b2writeForm() {
		return "/b2board/b2writeform";
	}
	
	@RequestMapping("/b2write")
	public String b2write(
	    @RequestParam("file1") MultipartFile file1,
	    @RequestParam("file2") MultipartFile file2,
	    @RequestParam("file3") MultipartFile file3,
	    HttpServletRequest request, Model model) {
	    try {
	        String writer = request.getParameter("writer");
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");

	        String imageURL1 = b2uploadFile(file1);
	        String imageURL2 = b2uploadFile(file2);
	        String imageURL3 = b2uploadFile(file3);

	        b2dao.writeDao(writer, title, content, imageURL1, imageURL2, imageURL3);

	        return "redirect:b2list";
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:b2list";
	}

	private String b2uploadFile(MultipartFile file) throws IOException {
	    if (!file.isEmpty()) {
	        String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	        String filePath = Paths.get(uploadDirectory, fileName).toString();
	        Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
	        return "/uploads/" + fileName;
	    }
	    return null;
	}
	

	
	@RequestMapping("/b2modifyform")
	public String b2modifyForm(int b2_number, HttpServletRequest request, Model model) {
		//String b1_number = request.getParameter("b1_number");
		
		model.addAttribute("dto", b2dao.viewDao(b2_number));
		return "/b2board/b2modifyform";
	}
	
	@RequestMapping("/b2modify")
	public String b2modify(
	        @RequestParam("b2_number") int b2_number,
	        @RequestParam("file1") MultipartFile file1,
	        @RequestParam("file2") MultipartFile file2,
	        @RequestParam("file3") MultipartFile file3,
	        HttpServletRequest request, Model model) {
	        try {
	            String writer = request.getParameter("writer");
	            String title = request.getParameter("title");
	            String content = request.getParameter("content");

	            B2Dto existingDTO = b2dao.viewDao(b2_number);

	            String imageURL1 = file1.isEmpty() ? existingDTO.getImageurl1() : b2uploadFile(file1);
	            String imageURL2 = file2.isEmpty() ? existingDTO.getImageurl2() : b2uploadFile(file2);
	            String imageURL3 = file3.isEmpty() ? existingDTO.getImageurl3() : b2uploadFile(file3);
	            String b2_number1 = Integer.toString(b2_number);
	            
	            Map<String, String> parameters = new HashMap<>();
	            parameters.put("writer", writer);
	            parameters.put("title", title);
	            parameters.put("content", content);
	            parameters.put("imageurl1", imageURL1);
	            parameters.put("imageurl2", imageURL2);
	            parameters.put("imageurl3", imageURL3);
	            parameters.put("b2_number", b2_number1);

	            b2dao.modifyDao(parameters);

	            return "redirect:b2list";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "redirect:b2list";
	        }
	}
	
	@RequestMapping("/b2delete")
	public String b2delete(HttpServletRequest request, Model model) {
		b2dao.deleteDao(request.getParameter("b2_number"));
		return "redirect:b2list";
	}
	
	@RequestMapping("/b2like")
	public String b2Like(HttpServletRequest request, Model model) {
		int check_b = Integer.parseInt(request.getParameter("check_b"));
		int t_number = Integer.parseInt(request.getParameter("t_number"));
		int m_number = Integer.parseInt(request.getParameter("m_number"));
		int l_or_dl = Integer.parseInt(request.getParameter("l_or_dl"));
		List<LikeDto> list = likedao.listDao(check_b, t_number, m_number);
		List<LikeDto> list2 = likedao.listDao2(check_b, t_number, m_number, l_or_dl);

		if (list.size() == 0) {

			if (l_or_dl == 1) {
				likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
				b2dao.likelyDao(t_number);
			} else if (l_or_dl == -1) {
				likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
				b2dao.dislikelyDao(t_number);
			}
		} else {
			if (list2.size() == 0) {
				likedao.deleteDao(check_b, t_number, m_number);
				b2dao.dislikeDropDao(t_number);
				if (l_or_dl == 1) {
					likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
					b2dao.likelyDao(t_number);
				
				} 
			}else
			{
				likedao.deleteDao(check_b, t_number, m_number);
				b2dao.likeDropDao(t_number);
				if(l_or_dl ==-1) {
					likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
					b2dao.dislikelyDao(t_number);
				}
			}
		}
	
		return "redirect:b2view?b2_number=" + request.getParameter("t_number") + "&check_b=2";
	}
	
	   ////////////////////////////////// play board
	   ////////////////////////////////// ///////////////////////////////////////////////////////

	//   
	//   @RequestMapping("/playlist")
	//   public String playListPage(Model model) {
//	      model.addAttribute("playlist", playdao.plistDao());
//	      return "/playboard/playlist";
	//   }

	   @RequestMapping("/1/playview")
	   public String playView(HttpServletRequest request, Model model) {
	      int f_number = Integer.parseInt(request.getParameter("f_number"));
	      int check_b = Integer.parseInt(request.getParameter("check_b"));
	      model.addAttribute("playview", playdao.viewDao(f_number));
	      model.addAttribute("commentview", cmtdao.viewDao(check_b, f_number));
	      return "/playboard/playview";
	   }

	   @RequestMapping("/1/replywrite")
	   public String playCmtStore(HttpServletRequest request, Model model) {

	      int check_b = Integer.parseInt(request.getParameter("check_b"));
	      int m_number = Integer.parseInt(request.getParameter("m_number"));
	      int t_number = Integer.parseInt(request.getParameter("t_number"));
	      String cmt = request.getParameter("cmt");
	      System.out.println(cmt);
	         if (cmt == null || cmt.isEmpty()) {
	            System.out.println(1111);
	            return "redirect:/1/playview?f_number=" + t_number + "&check_b=3";
	         
	         }
	      
	      cmtdao.writeDao(check_b, m_number, request.getParameter("nickname"), request.getParameter("cmt"), t_number);
	      
	      return "redirect:/1/playview?f_number=" + request.getParameter("t_number") + "&check_b=3";
	   }

	   @RequestMapping("/1/replydelete")
	   public String replyDelete(HttpServletRequest request, Model model) {
	      int t_number = Integer.parseInt(request.getParameter("t_number"));
	      int c_number = Integer.parseInt(request.getParameter("c_number"));
	      cmtdao.deleteDao(c_number);
	      return "redirect:/1/playview?f_number=" + request.getParameter("t_number") + "&check_b=3";

	   }

	   @RequestMapping("/1/playwriteform")
	   public String playWriteForm() {
	      return "/playboard/playwriteform";
	   }

	   @RequestMapping("/1/playwrite")
	   public String playWrite(@RequestParam("file") MultipartFile file,
	                     HttpServletRequest request, Model model,
	                     @Valid @ModelAttribute("playBoard") PlayDto playBoard, BindingResult bindingResult) 
	      {
	      if (bindingResult.hasErrors()) {
	         // validation 실패
	         System.out.println("validation에 실패했습니다.");
	         return "b1board/b1writeform";
	      }
	      try {
	         String writer = playBoard.getWriter();
	         String title = playBoard.getTitle();
	         String content = playBoard.getContent();

	         String imageURL = "";
	         if (file != null && !file.isEmpty()) {
	            imageURL = uploadFile(file);
	         }else {
	            imageURL="http://localhost:8082/images/111.png";
	         }

	         playdao.writeDao(writer, title, content, imageURL);

	         int f_number = playdao.selectDao();
	         
	         return "redirect:/1/playview?f_number=" + f_number + "&check_b=3";

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return "redirect:/1/playpage?page=1";
	   }

	   @RequestMapping("/1/playmodifyview")
	   public String playModifyView(HttpServletRequest request, Model model) {
	      int pId = Integer.parseInt(request.getParameter("f_number"));
	      model.addAttribute("playmodify", playdao.viewDao(pId));
	      return "/playboard/playmodify";
	   }

	   @RequestMapping("/1/playmodify")
	   public String playModify(@RequestParam("file") MultipartFile file, HttpServletRequest request, Model model) {

	      try {

	         String writer = request.getParameter("writer");
	         String title = request.getParameter("title");
	         String content = request.getParameter("content");
	         int f_number = Integer.parseInt(request.getParameter("f_number"));

	         PlayDto existingDTO = playdao.viewDao(f_number);
	         String imageURL = file.isEmpty() ? existingDTO.getImageurl() : uploadFile(file);

	         playdao.modifyDao(writer, title, content, imageURL, f_number);
	         return "redirect:/1/playpage?f_number=" + request.getParameter("f_number") + "&check_b=3";

	      } catch (Exception e) {
	         e.printStackTrace();
	         return "redirect:/1/playpage?f_number=" + request.getParameter("f_number") + "&check_b=3";
	      }

	   }

	   @RequestMapping("/1/playdelete")
	   public String playDelete(HttpServletRequest request, Model model) {
	      int f_number = Integer.parseInt(request.getParameter("f_number"));
	      playdao.deleteDao(f_number);
	      return "redirect:/1/playpage?page=1";
	   }

	   @RequestMapping("/1/playlike")
	   public String playLike(HttpServletRequest request, Model model) {
	      int check_b = Integer.parseInt(request.getParameter("check_b"));
	      int t_number = Integer.parseInt(request.getParameter("t_number"));
	      int m_number = Integer.parseInt(request.getParameter("m_number"));
	      int l_or_dl = Integer.parseInt(request.getParameter("l_or_dl"));
	      List<LikeDto> list = likedao.listDao(check_b, t_number, m_number);
	      List<LikeDto> list2 = likedao.listDao2(check_b, t_number, m_number, l_or_dl);

	      if (list.size() == 0) {

	         if (l_or_dl == 1) {
	            likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
	            playdao.likelyDao(t_number);
	         } else if (l_or_dl == -1) {
	            likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
	            playdao.dislikelyDao(t_number);
	         }
	      } else {
	         if (list2.size() == 0) {
	            likedao.deleteDao(check_b, t_number, m_number);
	            playdao.dislikeDropDao(t_number);
	            if (l_or_dl == 1) {
	               likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
	               playdao.likelyDao(t_number);

	            }
	         } else {
	            likedao.deleteDao(check_b, t_number, m_number);
	            playdao.likeDropDao(t_number);
	            if (l_or_dl == -1) {
	               likedao.likeClickDao(check_b, t_number, m_number, l_or_dl);
	               playdao.dislikelyDao(t_number);
	            }
	         }
	      }
	      return "redirect:/1/playview?f_number=" + request.getParameter("t_number") + "&check_b=3";
	   }

	   @RequestMapping("/1/playpage")
	   public String playlistpage(HttpServletRequest request, Model model) {

	      int total = playdao.listCountDao().size();
	      int pageSize = 16;

	      // 3. 전체 게시물 수를 한 페이지에 표시할 게시물 수로 나눕니다.
	      int totalPage = total / pageSize;

	      // 4. 나머지가 있으면 다음 페이지가 있다는 의미이므로 해당 페이지 번호를 계산합니다.
	      if (total % pageSize > 0) {
	         totalPage++;
	      }

	   
	      // 5. 현재 페이지 번호를 가져옵니다.
	      String sPage = request.getParameter("page");
	      int page = sPage == null ? 1 : Integer.parseInt(sPage);

	      // 6. 1단계에서 계산한 페이지 번호 범위 내에서 현재 페이지 번호에 해당하는 게시물을 조회합니다.
	      List<PlayDto> list = playdao.pageDao(page, pageSize);

	      int nStart = (page - 1) * pageSize + 1;
	      int nEnd = (page - 1) * pageSize + pageSize;

	      list = playdao.pageDao(nEnd, nStart);
	      model.addAttribute("list", list);
	      model.addAttribute("totalPage", totalPage);
	      model.addAttribute("page", page);
	      model.addAttribute("playlist", playdao.plistDao());

	      return "playboard/playlist";
	   }
	   
	   
	   
	   
	   
}
