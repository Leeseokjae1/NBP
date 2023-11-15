package com.study.nbnb;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class DownloadController {
    @Value("${upload.directory}")
    private String uploadDirectory;

    @GetMapping("/uploads/{fileName}")
    public void downloadImage(@PathVariable String fileName, HttpServletResponse response) {
        try {
	            Path imagePath = Paths.get(uploadDirectory, fileName);
	            if (Files.exists(imagePath)) {
	                response.setContentType("image/jpeg"); // 이미지 유형에 따라 변경
	                response.addHeader("Content-Disposition", "inline; filename=" + fileName);
	                Files.copy(imagePath, response.getOutputStream());
	                response.getOutputStream().flush();
	            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}