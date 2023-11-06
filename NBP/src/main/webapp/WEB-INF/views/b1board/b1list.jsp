<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
</head>
<body>
    <h1>게시판 리스트</h1>
    <table width="500" cellpadding="0" cellspacing="0" border="1">
        <tr>
            <td>번호</td>
            <td>작성자</td>
            <td>제목</td>
            <td>이미지</td>
            <td>삭제</td>
        </tr>
        <c:forEach items="${list}" var="dto">
            <tr>
                <td>${dto.b1_number}</td>
                <td>${dto.writer}</td>
                <td><a href="b1view?b1_number=${dto.b1_number}">${dto.title}</a></td>
                <td><img src="${dto.imageURL}" alt="사진" width="100" height="100"></td>
                <td><a href="b1delete?b1_number=${dto.b1_number}">X</a></td>
            </tr>
        </c:forEach>
    </table>
    <p><a href="b1writeform">글작성</a></p>
</body>
</html>