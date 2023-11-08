package com.study.nbnb;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.study.nbnb.dao.B1Dao;
import com.study.nbnb.dto.B1Dto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class NBController {

	@Autowired
	B1Dao dao;
	
    @Value("${upload.directory}")
    private String uploadDirectory;
	
	@RequestMapping("/")
	public String root() throws Exception{
		//MyBatis : SimpleBBS
		return "redirect:list";
	}
	
	@RequestMapping("/test")
	public String test(){
		return "test";
	}
	
	@RequestMapping("/main")
	public String mainview(){
		return "main_view";
	}
	
	@RequestMapping("/list")
	public String userlistpage(Model model) {
		model.addAttribute("list", dao.listDao());
		return "/b1board/b1list";
	}
	

	@RequestMapping("/b1view")
	public String view(HttpServletRequest request, Model model) {
		String b1_number = request.getParameter("b1_number");
		model.addAttribute("dto", dao.viewDao(b1_number));
		return "/b1board/b1view";
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

	        dao.writeDao(writer, title, content, imageURL1, imageURL2, imageURL3);

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
	public String modifyForm(String b1_number, HttpServletRequest request, Model model) {
		//String b1_number = request.getParameter("b1_number");
		model.addAttribute("dto", dao.viewDao(b1_number));
		return "/b1board/b1modifyform";
	}
	
	@RequestMapping("/b1modify")
	public String modify(
	        @RequestParam("b1_number") String b1_number,
	        @RequestParam("file1") MultipartFile file1,
	        @RequestParam("file2") MultipartFile file2,
	        @RequestParam("file3") MultipartFile file3,
	        HttpServletRequest request, Model model) {
	        try {
	            String writer = request.getParameter("writer");
	            String title = request.getParameter("title");
	            String content = request.getParameter("content");

	            B1Dto existingDTO = dao.viewDao(b1_number);

	            String imageURL1 = file1.isEmpty() ? existingDTO.getImageurl1() : uploadFile(file1);
	            String imageURL2 = file2.isEmpty() ? existingDTO.getImageurl2() : uploadFile(file2);
	            String imageURL3 = file3.isEmpty() ? existingDTO.getImageurl3() : uploadFile(file3);

	            Map<String, String> parameters = new HashMap<>();
	            parameters.put("writer", writer);
	            parameters.put("title", title);
	            parameters.put("content", content);
	            parameters.put("imageurl1", imageURL1);
	            parameters.put("imageurl2", imageURL2);
	            parameters.put("imageurl3", imageURL3);
	            parameters.put("b1_number", b1_number);

	            dao.modifyDao(parameters);

	            return "redirect:list";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "redirect:list";
	        }
	}
	
	@RequestMapping("/b1delete")
	public String delete(HttpServletRequest request, Model model) {
		dao.deleteDao(request.getParameter("b1_number"));
		return "redirect:list";
	}
	
	@RequestMapping("/like")
	public String like(HttpServletRequest request, Model model) {
		dao.deleteDao(request.getParameter("b1_number"));
		return "redirect:list";
	}
	
}