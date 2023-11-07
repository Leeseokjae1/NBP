<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
좋아요 : ${dto.b_like} &nbsp;&nbsp; 좋아요 : ${dto.b_dislike}
<hr>
<a href="b1modifyform?b1_number=${dto.b1_number}">수정하기</a>
<br><p>
<a href="list">목록보기</a>
</body>
</html>