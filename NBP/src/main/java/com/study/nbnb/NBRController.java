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
import com.study.nbnb.dao.ShopDao;
import com.study.nbnb.mail.EmailService;

import jakarta.mail.MessagingException;

@RestController
@RequestMapping("/api")
public class NBRController {
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	ShopDao shopdao;
	
	@Autowired
	BuserDao buserdao;

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
    	System.out.println(shopdao.selectDao2(m_number));
    	result.put("authCode", shopdao.selectDao2(m_number));
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
    	
    	result.put("buy_number", shopdao.insertDao(t_count, t_price, m_number));
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
		System.out.println(11111);
		System.out.println(password);
		System.out.println(mail);
    	Map<String, Object> result = new HashMap<>();
    	result.put("authCode", a);
        return ResponseEntity.ok(result);
    }
}
