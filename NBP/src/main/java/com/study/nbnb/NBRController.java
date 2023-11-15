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
    	System.out.println(1);
    	//횐번 주문번호
		int m_number = Integer.parseInt((String)requestData.get("m_number"));
		System.out.println(m_number);
    	Map<String, Object> result = new HashMap<>();
    	System.out.println(shopdao.selectDao2(m_number));
    	result.put("authCode", shopdao.selectDao2(m_number));
        return ResponseEntity.ok(result);
    }
	
	
	@PostMapping("insertPay")
    public ResponseEntity<Map<String, Object>> insertPay(@RequestBody Map<String, Object> requestData) throws MessagingException, UnsupportedEncodingException  {
    	System.out.println(1);
    	//횐번 주문번호
    	int t_count = (int)requestData.get("t_count");
		int t_price = (int)requestData.get("t_price");
		int m_number = (int)requestData.get("m_number");

		    	
    	Map<String, Object> result = new HashMap<>();
    	result.put("buy_number", shopdao.insertDao(t_count, t_price, m_number));
        return ResponseEntity.ok(result);
    }
}
