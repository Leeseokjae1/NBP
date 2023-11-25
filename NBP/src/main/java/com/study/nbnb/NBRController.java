package com.study.nbnb;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.study.nbnb.dao.AdDao;
import com.study.nbnb.dao.B1Dao;
import com.study.nbnb.dao.B2Dao;
import com.study.nbnb.dao.BuserDao;
import com.study.nbnb.dao.ChatRoomDao;
import com.study.nbnb.dao.CommentDao;
import com.study.nbnb.dao.GoodDao;
import com.study.nbnb.dao.LikeDao;
import com.study.nbnb.dao.PlayDao;
import com.study.nbnb.dao.RDao;
import com.study.nbnb.dao.SearchDao;
import com.study.nbnb.dao.ShopDao;
import com.study.nbnb.dto.B1Dto;
import com.study.nbnb.dto.B2Dto;
import com.study.nbnb.dto.BuserDto;
import com.study.nbnb.dto.ChatRoomDto;
import com.study.nbnb.dto.CommentDto;
import com.study.nbnb.dto.GoodDto;
import com.study.nbnb.dto.PlayDto;
import com.study.nbnb.dto.RankDto;
import com.study.nbnb.dto.ShopDto;
import com.study.nbnb.mail.EmailService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class NBRController {
	
	@Autowired
	EmailService emailService;
	@Autowired
	ShopDao shopDao;
	@Autowired
	BuserDao buserdao;
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
	@Autowired
	SearchDao searchDao;
	@Autowired
	ChatRoomDao crdao;
	@Autowired
	AdDao addao;
	@Autowired
	RDao rdao;
	@Autowired
	GoodDao gooddao;	

	@RequestMapping("/test")
	   public String test(Model model){
	      List<BuserDto> myList = buserDao.listDao();
	      String myListJson = new Gson().toJson(myList);
	      model.addAttribute("list", myListJson);
	      
	      return "test";
	   }
		
	@PostMapping("emailCheck")
    public ResponseEntity<Map<String, Object>> emailCheck(@RequestBody Map<String, Object> requestData) throws MessagingException, UnsupportedEncodingException  {
    	System.out.println(1);
    	
		String mail = String.valueOf(requestData.get("mail"));
    	String authCode = emailService.sendEmail(mail);
    	Map<String, Object> result = new HashMap<>();
    	result.put("authCode", authCode);
        return ResponseEntity.ok(result);
    }
	

	@PostMapping("buy_number")
    public ResponseEntity<Map<String, Object>> buyPay(@RequestBody Map<String, Object> requestData) throws MessagingException, UnsupportedEncodingException  {
    	
		int m_number = Integer.parseInt((String)requestData.get("m_number"));
		System.out.println(m_number);
    	Map<String, Object> result = new HashMap<>();
    	System.out.println(shopDao.selectDao2(m_number));
    	result.put("authCode", shopDao.selectDao2(m_number));
        return ResponseEntity.ok(result);
    }
	
	
	@PostMapping("insertPay")
    public ResponseEntity<Map<String, Object>> insertPay(@RequestBody Map<String, Object> requestData) throws MessagingException, UnsupportedEncodingException  {
    	
    	int t_count = (int)requestData.get("t_count");
		int t_price = (int)requestData.get("t_price");
		int m_number = (int)requestData.get("m_number");
		
		System.out.println(t_count);
		System.out.println(t_price);
		System.out.println(m_number);
		
    	Map<String, Object> result = new HashMap<>();
//    	buserdao.updateTicket(t_count, m_number);
    	int a=buserdao.updateTicket(t_count, m_number);
    	
    	result.put("buy_number", shopDao.insertDao(t_count, t_price, m_number));
        return ResponseEntity.ok(result);
    }
	
	@PostMapping("emailId")
    public ResponseEntity<Map<String, Object>> emailId(@RequestBody Map<String, Object> requestData) throws MessagingException, UnsupportedEncodingException  {
		
		String mail = String.valueOf(requestData.get("mailToId"));
    	Map<String, Object> result = new HashMap<>();
    	result.put("authCode", buserdao.emailDao(mail));
        return ResponseEntity.ok(result);
    }
	
	@RequestMapping("/pwUpdate")
	public ResponseEntity<Map<String, Object>> pwUpdate(@RequestBody Map<String, Object> requestData) throws MessagingException, UnsupportedEncodingException  {
		
		String encoded=PasswordEncoderFactories.createDelegatingPasswordEncoder().encode(String.valueOf(requestData.get("pw")));
		String password = encoded.substring(8);
		String mail = String.valueOf(requestData.get("email"));
		int a = buserdao.emailPwDao(mail, password);
    	Map<String, Object> result = new HashMap<>();
    	result.put("authCode", a);
        return ResponseEntity.ok(result);
    }
	
	 @RequestMapping("/goodpost")
	 @ResponseBody
     public ResponseEntity<Map<String, Object>> getgoodpost(HttpServletRequest request, @RequestBody Map<String, Object> requestData) {
         HttpSession session = request.getSession();
         BuserDto bdto = (BuserDto)session.getAttribute("login");
         int m_number = bdto.getM_NUMBER();
         int t_number = m_number;
         List<GoodDto> getgoodpost = gooddao.getgoodpost(t_number);

         Map<String, Object> response = new HashMap<>();
         response.put("getgoodpost", getgoodpost);
         
         return ResponseEntity.ok(response);
	 }
	 
//////////////////////////////////////////////////Main//////////////////////////////////////////////////	 	 
	 
	    @GetMapping("/b1page")
	    @ResponseBody
	    public ResponseEntity<List<B1Dto>> getB1List() {
	        try {
	            List<B1Dto> list = b1dao.listDao();

	            return new ResponseEntity<>(list, HttpStatus.OK);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
	    
	    @GetMapping("/b2page")
	    @ResponseBody
	    public ResponseEntity<List<B2Dto>> getB2List() {
	        try {
	            List<B2Dto> list = b2dao.listDao(); // 모든 데이터를 가져옵니다.

	            return new ResponseEntity<>(list, HttpStatus.OK);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
	    
	    @GetMapping("/plpage")
	    @ResponseBody
	    public ResponseEntity<List<PlayDto>> getPlList() {
	        try {
	            List<PlayDto> list = playdao.plistDao(); // 모든 데이터를 가져옵니다.

	            return new ResponseEntity<>(list, HttpStatus.OK);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
	
//////////////////////////////////////////////////View//////////////////////////////////////////////////	 	 
    @PostMapping("/b1view")
    public ResponseEntity<Map<String, Object>> getB1ViewData(@RequestBody Map<String, String> requestBody) {
        try {
            int b1_number = Integer.parseInt(requestBody.get("b1_number"));
            int check_b = Integer.parseInt(requestBody.get("check_b"));

            B1Dto b1Dto = b1dao.viewDao(b1_number);
            List<CommentDto> commentList = cmtdao.viewDao(check_b, b1_number);

            Map<String, Object> responseData = new HashMap<>();
            responseData.put("b1Dto", b1Dto);
            responseData.put("commentList", commentList);

            return new ResponseEntity<>(responseData, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/b2view")
    public ResponseEntity<Map<String, Object>> getB2ViewData(@RequestBody Map<String, String> requestBody) {
        try {
            int b2_number = Integer.parseInt(requestBody.get("b2_number"));
            int check_b = Integer.parseInt(requestBody.get("check_b"));

            B2Dto b2Dto = b2dao.viewDao(b2_number);
            List<CommentDto> commentList = cmtdao.viewDao(check_b, b2_number);

            Map<String, Object> responseData = new HashMap<>();
            responseData.put("b2Dto", b2Dto);
            responseData.put("commentList", commentList);

            return new ResponseEntity<>(responseData, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	 @PostMapping("/playview")
	 @ResponseBody
	 public ResponseEntity<Map<String, Object>> playView(@RequestBody Map<String, String> requestBody) {
		 Map<String, Object> responseData = new HashMap<>();	
		 
		 int f_number = Integer.parseInt(requestBody.get("f_number"));
		 int check_b = Integer.parseInt(requestBody.get("check_b"));
		 
		 
		 PlayDto pdto = playdao.viewDao(f_number);
		 List<CommentDto> cdto = cmtdao.viewDao(check_b, f_number);
		 
		 responseData.put("playview", pdto);
		 responseData.put("commentview", cdto);
		 
		 return new ResponseEntity<>(responseData, HttpStatus.OK);
	 }
//////////////////////////////////////////////////write//////////////////////////////////////////////////	 
//	 
//	    @Value("${upload.directory}")
//	    private String uploadDirectory;
//	    
//		private String uploadFile(MultipartFile file) throws IOException {
//		    if (!file.isEmpty()) {
//		        String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
//		        String filePath = Paths.get(uploadDirectory, fileName).toString();
//		        Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
//		        return "/uploads/" + fileName;
//		    }
//		    return null;
//		}
//	 
//	 @RequestMapping("/member/playwriteform")
//	 @ResponseBody
//	 public ResponseEntity<Map<String, Object>>playWriteForm(HttpServletRequest request, Model model) {
//		 Map<String, Object> response = new HashMap<>();	
//		 int m_number = Integer.parseInt(request.getParameter("m_number"));
//		 response.put("member", buserDao.selectUser(m_number));
//		 return ResponseEntity.ok(response);
//		 //"playboard/playwriteform";
//	 }
//	 
//	 
//	 @RequestMapping("/member/playwrite")
//	 @ResponseBody
//	 public ResponseEntity<Map<String, Object>>playWrite(@RequestParam("file") MultipartFile file,
//								 						@RequestParam("m_number") int m_number,
//								 						HttpServletRequest request,
//								 						@Valid @ModelAttribute("playBoard") PlayDto playBoard, 
//								 						BindingResult bindingResult) {
//		 Map<String, Object> response = new HashMap<>();	 
//		 if (bindingResult.hasErrors()) {
//			 response.put("success", false);
//	         response.put("message", "Validation failed");
//	         return ResponseEntity.badRequest().body(response);
//	     }
//		try {
//			String writer = playBoard.getWriter();
//			String title = playBoard.getTitle();
//			String content = playBoard.getContent();
//	
//			String imageURL = "";
//			if (file != null && !file.isEmpty()) {
//				imageURL = uploadFile(file);
//			}else {
//				imageURL="/images/play.png";
//			}
//	
//			playdao.writeDao(writer, title, content, imageURL, m_number);
//	
//			int f_number = playdao.selectDao();
//			
//			response.put("success", true);
//	        response.put("message", "Play written successfully");
//	        response.put("f_number", f_number);
//	        
//		 } catch (Exception e) {
//		        e.printStackTrace();
//		        response.put("success", false);
//		        response.put("message", "An error occurred");
//		 }
//		 return ResponseEntity.ok(response);
//	}
//	 
//	 
//////////////////////////////////////////////////delete//////////////////////////////////////////////////
	 
//////////////////////////////////////////////////list//////////////////////////////////////////////////

//////////////////////////////////////////////////Rank//////////////////////////////////////////////////
	
	 @GetMapping("/rpage")
	 @ResponseBody
     public ResponseEntity<Map<String, Object>> showb1Ranking(HttpServletRequest request, Model model) {
	    Map<String, Object> response = new HashMap<>();

        List<RankDto> userRankingList = rdao.getUserRanking();
        List<RankDto> top10UserRankingList = userRankingList.stream().limit(10).collect(Collectors.toList());

        response.put("userRankingList", top10UserRankingList);
        
        return ResponseEntity.ok(response);
    }
	 
//////////////////////////////////////////////////MyPage//////////////////////////////////////////////////	 
	 
	 @RequestMapping("/mypage")
	 @ResponseBody
	 public ResponseEntity<Map<String, Object>> mypageview(HttpServletRequest request, @RequestBody Map<String, String> requestBody){
		 Map<String, Object> responseData = new HashMap<>();	
		 HttpSession session = request.getSession();
		 
		 BuserDto bdto = (BuserDto)session.getAttribute("login");
		
		 responseData.put("login", bdto);
		 return new ResponseEntity<>(responseData, HttpStatus.OK);
	 }
	 
	 @GetMapping("/1/profile")
	 @ResponseBody
	 public ResponseEntity<Map<String, Object>> profile(HttpServletRequest request, Model model) {
		BuserDto bdto = (BuserDto)(request.getSession().getAttribute("login"));
		Map<String, Object> response = new HashMap<>();
		response.put("user", buserDao.selectUser(bdto.getM_NUMBER()));
		return ResponseEntity.ok(response);
	 }
	 
	 @GetMapping("/mshop")
	 @ResponseBody
	 public ResponseEntity<Map<String, Object>> mypageshopview(HttpServletRequest request,
	         @RequestParam(name = "param1", required = false) String param1,
	         @RequestParam(name = "param2", required = false) String param2) {
	     try {
	         Map<String, Object> responseData = new HashMap<>();
	         HttpSession session = request.getSession();

	         BuserDto bdto = (BuserDto) session.getAttribute("login");
	         System.out.println(bdto.getID());

	         responseData.put("login", bdto);
	         return new ResponseEntity<>(responseData, HttpStatus.OK);
	     } catch (Exception e) {
	         e.printStackTrace();
	         return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	     }
	 }
	 @GetMapping("/goodpost")
	 @ResponseBody
	 public ResponseEntity<Map<String, Object>>getgoodpost(HttpSession session, @RequestBody Map<String, String> requestBody) {
		 Map<String, Object> responseData = new HashMap<>();	
		 
         BuserDto bdto = (BuserDto)session.getAttribute("login");
         int m_number = bdto.getM_NUMBER();
         
         int t_number = m_number;
         List<GoodDto> getgoodpost = gooddao.getgoodpost(t_number);
  
         responseData.put("getgoodpost", getgoodpost);
         return new ResponseEntity<>(responseData, HttpStatus.OK);
         //"mypage/mypage_good"; 
	 }
		
	@RequestMapping("/mypage_popup")
	@ResponseBody
	 public ResponseEntity<Map<String, Object>> shopPopup(HttpSession session, @RequestBody Map<String, String> requestBody) {
		 Map<String, Object> responseData = new HashMap<>();
		int t_count = Integer.parseInt(requestBody.get("t_count"));
		int t_price = Integer.parseInt(requestBody.get("t_price"));
	
		ShopDto a = shopDao.selectDao3();
		if(a == null) {
	
			a=new ShopDto();
			a.setBuy_number(1);
			
		}
		a.setT_count(t_count);
		a.setT_price(t_price);
	
		responseData.put("shopdto", a);
		return new ResponseEntity<>(responseData, HttpStatus.OK);
	}
	
	@RequestMapping("/shopping_list")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> shoppinglist(@RequestBody Map<String, String> requestBody) {
		Map<String, Object> responseData = new HashMap<>();	
		
		int m_number = Integer.parseInt(requestBody.get("m_number"));
		responseData.put("shoplist", shopDao.listDao(m_number));
		return new ResponseEntity<>(responseData, HttpStatus.OK);
		//"mypage/shopping_list";
	}
	
	@RequestMapping("/mpchat")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> myPageChatview(HttpSession session, @RequestBody Map<String, String> requestBody) {
		Map<String, Object> responseData = new HashMap<>();
		
		BuserDto a = (BuserDto)session.getAttribute("login");
		List<ChatRoomDto> cr = crdao.listroomDao(a.getNICKNAME());
		responseData.put("chat", cr);
		
		return new ResponseEntity<>(responseData, HttpStatus.OK);
		//"mypage/mypage_talk";
	}
	
//////////////////////////////////////////////////Search//////////////////////////////////////////////////
	 
	 @RequestMapping("/playcontent")
	 @ResponseBody
	 public ResponseEntity<Map<String, Object>> playcontentpage(HttpServletRequest request, Model model) {
		 Map<String, Object> response = new HashMap<>(); 
		 
	     String kw1 = request.getParameter("Searchdata");
	     String kw = "%" +  kw1 + "%";
	     int total = playdao.contentCountDao(kw).size();
	     int pageSize = 8;
	
	     int totalPage = total / pageSize;
	
	     if (total % pageSize > 0) {
	          totalPage++;
	     }
	
	     String sPage = request.getParameter("page");
	     int page = sPage == null ? 1 : Integer.parseInt(sPage);
	
	     int nStart = (page - 1) * pageSize + 1;
	     int nEnd = (page - 1) * pageSize + pageSize;
	
	     List<PlayDto> list = playdao.contentsearchDao(kw, nEnd, nStart);
	     
	     response.put("playlist", list);
	     response.put("totalPage", totalPage);
	     response.put("page", page);
	        
	     return ResponseEntity.ok(response);
     }
}
