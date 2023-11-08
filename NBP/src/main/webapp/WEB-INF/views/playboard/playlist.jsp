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


<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>좋아요 / 싫어요</td>
		<td>삭제</td>
	</tr>
	<c:forEach items="${playlist}" var="play">
	<tr>
		<td>${play.f_number}</td>
		<td>${play.writer}</td>
		
		<td><a href="playview?f_number=${play.f_number}&check_b=3">${play.title}</a></td>
		<td>👍🏻: ${play.b_like} / 👎 : ${play.b_dislike}</td>
		<td><a href="playdelete?f_number=${play.f_number}">X</td>
	</tr>
	</c:forEach>
</table>

<p><a href="playwriteform">글작성</a></p>
</body>
</html>