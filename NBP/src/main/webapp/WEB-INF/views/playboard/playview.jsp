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
제목 : ${playview.title} <br>
작성자 : ${playview.writer} &nbsp &nbsp 
<a href= "../playlike?check_b=3&t_number=${playview.f_number}&m_number=1&l_or_dl=1">👍:${playview.b_like}</a> &nbsp 
<a href= "../playlike?check_b=3&t_number=${playview.f_number}&m_number=1&l_or_dl=-1">싫어요:👎🏻</a><br>
내용 : ${playview.content}<br>

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