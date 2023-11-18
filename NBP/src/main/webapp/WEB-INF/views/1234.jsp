<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.study.nbnb.dto.BuserDto" %>
<%
int m_number = 0;
if(session.getAttribute("login") != null){
BuserDto member = (BuserDto)session.getAttribute("login");
m_number = member.getM_NUMBER();
String writer = member.getNICKNAME();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<title>Insert title here</title>
 <style>
 .test{}
       body {
           background-color: #f8f9fa;
       }
       .ranking-container {
           margin: 20px;
       }
       .ranking-item {
           background-color: #ffffff;
           border: 1px solid #dee2e6;
           border-radius: 5px;
           margin-bottom: 15px;
           padding: 15px;
           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
       }
       .ranking-item h3 {
           color: #007bff;
       }
       .like-button {
           background-color: #007bff;
           color: #fff;
           margin-top: 10px;
       }
       .like-count {
           color: #007bff;
           margin-left: 5px;
       }
   </style>
</head>
<body>

   <div class="container">
       <h1 class="text-center my-4">빵 랭킹</h1>
       <div class="row ranking-container">
           <!-- 랭킹 항목 루프 시작 -->
           <div class="col-md-12">
               <div class="ranking-item">
                   <h3>1위 아이템</h3>
                   <!-- 다른 항목 세부 정보 -->
                   <button class="btn btn-primary like-button">좋아요</button>
                   <span class="like-count">100개의 좋아요</span>
               </div>
           </div>
           <div class="col-md-6">
               <!-- 다음 랭킹 항목 -->
           </div>
           <!-- 랭킹 항목 루프 끝 -->
       </div>
   </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>