<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>


내용보기 <br>
<hr>
작성자 : ${dto.writer}&nbsp;님 <br>
제목 : ${dto.title} <br>
내용 : ${dto.content}<br/>
사진 : <img src="${dto.imageurl1}" style="width:100px; height:100px;">
<img src="${dto.imageurl2}" style="width:100px; height:100px;">
<img src="${dto.imageurl3}" style="width:100px; height:100px;"><br />
좋아요 : ${dto.b_like} &nbsp;&nbsp; 싫어요 : ${dto.b_dislike} <br />
<a href="/like"><img src="/images/111.png" style="width:70px; height:70px;"></a>&nbsp;
<a href="/dislike"><img src="/images/222.png" style="width:70px; height:70px;"></a>
<hr>
<a href="b1modifyform?b1_number=${dto.b1_number}" class="btn btn-primary">수정하기</a>
<br><p>
<a href="list">목록보기</a>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
</body>
</html>