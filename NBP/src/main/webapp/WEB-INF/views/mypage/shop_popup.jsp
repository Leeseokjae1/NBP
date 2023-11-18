<%@page import="com.study.nbnb.dto.BuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
 <%
 BuserDto a = (BuserDto)session.getAttribute("login");
 int m_number = a.getM_NUMBER();
 %>
<title>Insert title here</title>
</head>
<body>
  <!-- 결제 UI, 이용약관 UI 영역 -->
  <div id="payment-method"></div>
  <div id="agreement"></div>
 
  <!-- 결제하기 버튼 -->
  <button id="payment-button">결제하기</button>
  <script>
  	const generateRandomString = () => window.btoa(Math.random()).slice(0, 20);
    const clientKey = "test_ck_ORzdMaqN3wPyyMy0WNlDV5AkYXQG"
    const customerKey = generateRandomString(); // 내 상점에서 고객을 구분하기 위해 발급한 고객의 고유 ID
    const button = document.getElementById("payment-button")
    


    // ------  결제위젯 초기화 ------ 
    // 비회원 결제에는 customerKey 대신 ANONYMOUS를 사용하세요.
    const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제

    // ------  결제 UI 렌더링 ------ 
    // 결제 UI를 렌더링할 위치를 지정합니다. `#payment-method`와 같은 CSS 선택자와 결제 금액 객체를 추가하세요.
    // DOM이 생성된 이후에 렌더링 메서드를 호출하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
    const paymentMethodWidget = paymentWidget.renderPaymentMethods(
      "#payment-method", 
      {
    	    value: ${shopdto.t_price},
    	    currency: 'KRW',
    	    country: 'KR',
    	  },
      // 렌더링하고 싶은 결제 UI의 variantKey
      // 결제 수단 및 스타일이 다른 멀티 UI를 직접 만들고 싶다면 계약이 필요해요.
      // https://docs.tosspayments.com/guides/payment-widget/admin#멀티-결제-ui
      { variantKey: "DEFAULT" } 
    )

    // ------  이용약관 UI 렌더링 ------
    // 이용약관 UI를 렌더링할 위치를 지정합니다. `#agreement`와 같은 CSS 선택자를 추가하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자-옵션
    paymentWidget.renderAgreement(
      '#agreement',
      { variantKey: "AGREEMENT" } // 기본 이용약관 UI 렌더링
    )

    // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
    // 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
    button.addEventListener("click", function () {
      paymentWidget.requestPayment({
        orderId: "${shopdto.buy_number}"+<%= m_number%>,            
        orderName: "채팅권",
        paymentKey:"1",
        m_number:<%= m_number%>,
        buy_number:"${shopdto.buy_number}",
        successUrl: 'http://localhost:8081/success?m_number=${shopdto.m_number}&buy_number=${shopdto.buy_number}',        
        failUrl: 'http://localhost:8081/fail?m_number=${shopdto.m_number}&buy_number=${shopdto.buy_number}'
 		
      
    	  })
 	  })
  </script>
</body>
</html>