<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
         <li><a href="/list">니빵이</a></li>
         <li><a href="/b2list">내빵이</a></li>
         <li><a href="#">랭킹빵</a></li>
         <li><a href="/playlist">놀이빵</a></li>
         <li><a href="#">로그인</a></li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="#">로그아웃</a></li>
       </ul>
    </nav>

내용보기 <br>
<hr>
제목 : ${playview.title} <br>
작성자 : ${playview.writer} &nbsp; &nbsp; 
<a href= "../playlike?check_b=3&t_number=${playview.f_number}&m_number=1&l_or_dl=1">👍:${playview.b_like}</a> &nbsp; 
<a href= "../playlike?check_b=3&t_number=${playview.f_number}&m_number=1&l_or_dl=-1">👎:${playview.b_dislike}</a><br>
내용 : ${playview.content}<br>
사진 : <img src="${playview.imageurl}" style="width:100px; height:100px;">

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
		<td><a href ="replydelete?c_number=${comment.c_number}&t_number=${comment.t_number}">X</td>
	
	</tr>
	</c:forEach>
</table>

	<form method = "post" action="replywrite">
	<p>
		<label>댓글 작성자</label> <input type="text" name ="nickname">
	</p>
	<p>
		<textarea rows="5" cols="50" name="cmt"></textarea>
	</p>
	<p>
		<input type="hidden" name="check_b" value=3>
		<input type="hidden" name="m_number" value=1>
		<input type="hidden" name="t_number" value="${playview.f_number}">
		<button type = "submit"> 댓글 작성</button>
	</p>
	
	</form>
	
	<br><p>
<a href="playlist">목록보기</a>
<a href="playmodifyview?f_number=${playview.f_number}">수정</a>
<a href="playdelete?f_number=${playview.f_number}">삭제</a>
	


</body>
</html>