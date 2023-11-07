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
    <h1>니빵이 게시판</h1>

<table cellpadding="0" cellspacing="50" border="1">
    <c:forEach items="${list}" var="dto" varStatus="loop">
        <c:if test="${loop.index % 4 == 0}">
            <tr>
        </c:if>
        <td>
            <a href="b1view?b1_number=${dto.b1_number}">
                <img src="${dto.imageurl1}" style="width:200px; height:200px;"></a><br/>
            ${dto.b1_number} &nbsp;&nbsp; ${dto.writer}<br />
            ${dto.title} &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="b1delete?b1_number=${dto.b1_number}">X</a>
        </td>
        <c:if test="${loop.index % 4 == 3}">
            </tr>
        </c:if>
    </c:forEach>
</table>
    
    <p><a href="b1writeform">글작성</a></p>
</body>
</html>