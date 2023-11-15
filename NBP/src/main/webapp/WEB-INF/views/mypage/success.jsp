<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.Reader" %>
<%@ page import="java.net.URLEncoder" %>

<%


// ------ 결제 승인 API 호출 ------
 // @docs https://docs.tosspayments.com/guides/payment-widget/integration#3-결제-승인하기
  // TODO: 개발자센터에 로그인해서 내 결제위젯 연동 키 > 시크릿 키를 입력하세요. 시크릿 키는 외부에 공개되면 안돼요.
  // @docs https://docs.tosspayments.com/reference/using-api/api-keys
  String secretKey = "test_sk_DpexMgkW36R1YWXzWw1d3GbR5ozO:";
  
  Encoder encoder = Base64.getEncoder(); 
  byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
  String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);

  String orderId = request.getParameter("orderId");
  String paymentKey = request.getParameter("paymentKey");
  String amount = request.getParameter("amount");
  String buy_number = request.getParameter("buy_number");
  String m_number = request.getParameter("m_number");
  paymentKey = URLEncoder.encode(paymentKey, "UTF-8");
  
  URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
  
  HttpURLConnection connection = (HttpURLConnection) url.openConnection();
  connection.setRequestProperty("Authorization", authorizations);
  connection.setRequestProperty("Content-Type", "application/json");
  connection.setRequestMethod("POST");
  connection.setDoOutput(true);
  JSONObject obj = new JSONObject();
  obj.put("paymentKey", paymentKey);
  obj.put("orderId", orderId);
  obj.put("amount", amount);

	
  
  OutputStream outputStream = connection.getOutputStream();
  outputStream.write(obj.toString().getBytes("UTF-8"));
  
  int code = connection.getResponseCode();
  boolean isSuccess = code == 200 ? true : false;
  
  InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
  
  Reader reader = new InputStreamReader(responseStream, "UTF-8");
  JSONParser parser = new JSONParser();
  JSONObject jsonObject = (JSONObject) parser.parse(reader);
  responseStream.close();
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
    <script src="https://code.jquery.com/jquery.js" ></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>토스페이먼츠 샘플 프로젝트</title>
  </head>
  
    <body>
    <section>
        <%
        if (isSuccess) { %>

            <div class="result wrapper">
                <div class="box_section">  
                <!-- 결제 성공 시 -->
                  <h2 style="padding: 20px 0px 10px 0px">
                    <img
                      width="35px"
                      src="https://static.toss.im/3d-emojis/u1F389_apng.png"
                    />
                    결제 성공
                  </h2>
                  <p>paymentKey : <%= jsonObject.get("paymentKey") %></p>
                  <p>orderId : <%= jsonObject.get("orderId") %></p>
                  <p>amount : <%= jsonObject.get("totalAmount") %></p>
              	  <p>buy_number : <%= buy_number %></p>
              	  <p>m_number : <%= m_number %></p>
                
                
                
                
                  <div class="result wrapper">
                    <button class="button" onclick="location.href='https://docs.tosspayments.com/guides/payment-widget/integration';"
                    style="margin-top:30px; ">연동 문서</button>
                    <button class="button" onclick="location.href='https://discord.gg/A4fRFXQhRu';"
                    style="margin-top:30px;background-color: #e8f3ff;color:#1b64da ">실시간 문의</button>
                  </div>   
                </div>
              </div>
          
          <script>
			window.onload=function a_submit() {
			      var m_number =<%= m_number %>;
			      var t_price = <%= jsonObject.get("totalAmount") %>;
			      var t_count = 0;
			  
			      if(t_price == 1000){
			    	  t_count = 1;
			      }else if(t_price == 2000){
			    	  t_count = 2;
			      }else if(t_price == 3000){
			    	  t_count = 3;
			      }else if(t_price == 4000){
			    	  t_count = 5;
			      }else if(t_price == 8000){
			    	  t_count = 10;
			      }
			      
			     
			      $.ajax({
			          type: "POST",
			          contentType: "application/json",
			          url: "/api/insertPay",
			          data: JSON.stringify({"m_number":m_number,"t_price":t_price,"t_count":t_count}), // 보낼 데이터
			          dataType: 'json',
			          success: function (response) {
			              console.log("Success:", response.buy_number);
			              if(response.success){
			            	  window.close();
			              }
			          },
			          error: function (error) {
			             
			          }
			      });
			   }

    </script>
        
        <%} else { %>
            <div class="result wrapper">
                <div class="box_section">   
                <!-- 결제 실패 시 -->
                    <h2 style="padding: 20px 0px 10px 0px">
                        <img
                        width="25px"
                        src="https://static.toss.im/3d-emojis/u1F6A8-apng.png"
                        />
                        결제 실패
                    </h2>
                    <input type="hidden" name="check" value=2>
                    
                  <p>paymentKey : <%= jsonObject.get("paymentKey") %></p>
                  <p>orderId : <%= jsonObject.get("orderId") %></p>
                  <p>amount : <%= jsonObject.get("totalAmount") %></p>
              	  <p>buy_number : <%= jsonObject.get("buy_number") %></p>
              	  <p>m_number : <%= jsonObject.get("membernumber") %></p>
              	  
              	  
                    <p><%= jsonObject.get("message") %></p>
                    <span>에러코드: <%= jsonObject.get("code") %></span>
                    <div class="result wrapper">
                        <button class="button" onclick="location.href='https://docs.tosspayments.com/guides/payment-widget/integration';"
                        style="margin-top:30px; ">연동 문서</button>
                        <button class="button" onclick="location.href='https://discord.gg/A4fRFXQhRu';"
                        style="margin-top:30px;background-color: #e8f3ff;color:#1b64da ">실시간 문의</button>
                      </div>                 
                </div>
            </div>
        <%
        }
        %>
    </section>
    
    </body>
    </html>