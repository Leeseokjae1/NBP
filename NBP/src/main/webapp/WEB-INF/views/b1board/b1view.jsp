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
<style>
    * {
       padding:0;
       margin:0;
    }
   ul,ol {
      list-style:none
   }
   a {
      text-decoration:none;color:#000;font-size:15px;
   }
   nav {
      width:80%;overflow:hidden;height:80px;margin:10px auto;
   }
   div img.absolute { 
        position: absolute;
        left: 50px;
        top: 500px;
      }
   #nav2>a {
      display: block; 
      float: left;
      font-size: 20px;
      font-weight: 900;
      line-height: 80px;
      padding: 0 30px;
   }
   #nav2>ul {
      float: right;
   }
   #nav2>ul li {
      float: left;
      padding: 0 30px;
      line-height: 80px;
   }
   #nav2>img .absolute { 
        position: absolute;
      left: 50px;
      }
</style>
</head>
<body>
   <nav id="nav2">
       <img src= "/img/nblogo.png" style="width:190px; height:80px;float: left; margin-right: 10px;">
<!-- <a href="#" style="float: right; margin-top: 10px;margin-right: 10px;">로그인</a> -->       
       <ul>
         <li><a href="/main">HOME</a></li>
         <li><a href="/b1page?page=1">니빵이</a></li>
         <li><a href="/b2page?page=1">내빵이</a></li>
         <li><a href="#">랭킹빵</a></li>
         <li><a href="/playpage?page=1">놀이빵</a></li>
         <li><a href="#">로그인</a></li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="#">로그아웃</a></li>
       </ul>
    </nav>

내용보기 <br>
<hr>
작성자 : ${dto.writer}&nbsp;님 <br>
제목 : ${dto.title} <br>
내용 : ${dto.content}<br/>
사진 : <img src="${dto.imageurl1}" style="width:100px; height:100px;">
<img src="${dto.imageurl2}" style="width:100px; height:100px;">
<img src="${dto.imageurl3}" style="width:100px; height:100px;"><br />
좋아요 : ${dto.b_like} &nbsp;&nbsp; 싫어요 : ${dto.b_dislike} <br />
<a href= "../b1like?check_b=1&t_number=${dto.b1_number}&m_number=1&l_or_dl=1">따봉<img src="/images/111.png" style="width:70px; height:70px;"></a>&nbsp;
<a href= "../b1like?check_b=1&t_number=${dto.b1_number}&m_number=1&l_or_dl=-1">언따봉<img src="/images/222.png" style="width:70px; height:70px;"></a>
<hr>

<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
	
		<td>작성자 </td>
		<td>내용 : </td>
		<td>삭제</td>
	</tr>
	<c:forEach items="${commentview}" var="comment">
	<tr>
		<td>${comment.nickname}</td>		
		<td>${comment.cmt}</td>
		<td><a href ="b1replydelete?c_number=${comment.c_number}&t_number=${comment.t_number}">X</td>	
	</tr>
	</c:forEach>
</table>

	<form method = "post" action="b1replywrite">
	<p>
		<label>댓글 작성자</label> <input type="text" name ="nickname">
	</p>
	<p>
		<textarea rows="5" cols="50" name="cmt"></textarea>
	</p>
	<p>
		<input type="hidden" name="check_b" value=1>
		<input type="hidden" name="m_number" value=1>
		<input type="hidden" name="t_number" value="${dto.b1_number}">
		<button type = "submit"> 댓글 작성</button>
	</p>
	
	</form>

<a href="b1modifyform?b1_number=${dto.b1_number}" class="btn btn-primary">수정하기</a>
<a href="b1delete?b1_number=${dto.b1_number}">삭제</a>
<br><p>
<a href="b1page?page=1">목록보기</a>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
</body>
</html>