package com.study.nbnb;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.study.nbnb.dao.B1Dao;

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
	        @RequestParam("writer") String writer,
	        @RequestParam("title") String title,
	        @RequestParam("content") String content,
	        @RequestParam(value = "imageurl1", required = false) String imageurl1,
	        @RequestParam(value = "imageurl2", required = false) String imageurl2,
	        @RequestParam(value = "imageurl3", required = false) String imageurl3,
	        @RequestParam(value = "file1", required = false) MultipartFile file1,
	        @RequestParam(value = "file2", required = false) MultipartFile file2,
	        @RequestParam(value = "file3", required = false) MultipartFile file3,
	        Model model) {
	    try {
	        // 이미지 URL 배열
	        String[] imageUrls = new String[3];
	        imageUrls[0] = imageurl1;
	        imageUrls[1] = imageurl2;
	        imageUrls[2] = imageurl3;

	        // 파일1 처리
	        if (!file1.isEmpty()) {
	            String fileName1 = UUID.randomUUID().toString() + "_" + file1.getOriginalFilename();
	            String filePath1 = Paths.get(uploadDirectory, fileName1).toString();
	            Files.copy(file1.getInputStream(), Paths.get(filePath1), StandardCopyOption.REPLACE_EXISTING);
	            imageUrls[0] = "/uploads/" + fileName1;
	        }

	        // 파일2 처리
	        if (!file2.isEmpty()) {
	            String fileName2 = UUID.randomUUID().toString() + "_" + file2.getOriginalFilename();
	            String filePath2 = Paths.get(uploadDirectory, fileName2).toString();
	            Files.copy(file2.getInputStream(), Paths.get(filePath2), StandardCopyOption.REPLACE_EXISTING);
	            imageUrls[1] = "/uploads/" + fileName2;
	        }

	        // 파일3 처리
	        if (!file3.isEmpty()) {
	            String fileName3 = UUID.randomUUID().toString() + "_" + file3.getOriginalFilename();
	            String filePath3 = Paths.get(uploadDirectory, fileName3).toString();
	            Files.copy(file3.getInputStream(), Paths.get(filePath3), StandardCopyOption.REPLACE_EXISTING);
	            imageUrls[2] = "/uploads/" + fileName3;
	        }

	        dao.modifyDao(b1_number, writer, title, content, imageUrls[0], imageUrls[1], imageUrls[2]);

	        return "redirect:list";
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:list";
	}
	
	@RequestMapping("/b1delete")
	public String delete(HttpServletRequest request, Model model) {
		dao.deleteDao(request.getParameter("b1_number"));
		return "redirect:list";
	}
}