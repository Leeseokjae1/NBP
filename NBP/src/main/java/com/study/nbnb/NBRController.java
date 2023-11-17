package com.study.nbnb;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.study.nbnb.dao.BuserDao;
import com.study.nbnb.mail.EmailService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api")
public class NBRController {
	
	@Autowired
	EmailService emailService;
	@Autowired
	BuserDao buserDao;
	
	@PostMapping("emailCheck")
    public ResponseEntity<Map<String, Object>> emailCheck(@RequestBody Map<String, Object> requestData) throws MessagingException, UnsupportedEncodingException  {
		String mail = String.valueOf(requestData.get("mail"));
    	String authCode = emailService.sendEmail(mail);
    	Map<String, Object> result = new HashMap<>();
    	result.put("authCode", authCode);
        return ResponseEntity.ok(result);
    }
	
	@PostMapping("emailId")
    public ResponseEntity<Map<String, Object>> emailId(@RequestBody Map<String, Object> requestData) throws MessagingException, UnsupportedEncodingException  {
		
		String mail = String.valueOf(requestData.get("mailToId"));
    	Map<String, Object> result = new HashMap<>();
    	result.put("authCode", buserDao.emailDao(mail));
        return ResponseEntity.ok(result);
    }
	
	@RequestMapping("/pwUpdate")
	public ResponseEntity<Map<String, Object>> pwUpdate(@RequestBody Map<String, Object> requestData) throws MessagingException, UnsupportedEncodingException  {
		
		String encoded=PasswordEncoderFactories.createDelegatingPasswordEncoder().encode(String.valueOf(requestData.get("pw")));
		String password = encoded.substring(8);
		String mail = String.valueOf(requestData.get("email"));
		int a = buserDao.emailPwDao(mail, password);
		System.out.println(11111);
		System.out.println(password);
		System.out.println(mail);
    	Map<String, Object> result = new HashMap<>();
    	result.put("authCode", a);
        return ResponseEntity.ok(result);
    }
	
}