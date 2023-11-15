package com.study.nbnb;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.study.nbnb.mail.EmailService;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api")
public class NBRController {
	
	@Autowired
	EmailService emailService;

	@PostMapping("emailCheck")
    public ResponseEntity<Map<String, Object>> emailCheck(@RequestBody Map<String, Object> requestData) throws MessagingException, UnsupportedEncodingException  {
    	System.out.println(1);
    	
		String mail = String.valueOf(requestData.get("mail"));
    	String authCode = emailService.sendEmail(mail);
    	Map<String, Object> result = new HashMap<>();
    	result.put("authCode", authCode);
        return ResponseEntity.ok(result);
    }
}