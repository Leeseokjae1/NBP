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
<br><p>

<table width="500" cellpadding="0" cellspacing="0" border="1">
    <form action="b1modify" method="post" enctype="multipart/form-data">
        <tr>
            <td> 작성자 </td>
            <td> <input type="text" name="writer" size="100" value="${dto.writer}"> </td>
        </tr>
        <tr>
            <td> 제목 </td>
            <td> <input type="text" name="title" size="100" value="${dto.title}"> </td>
        </tr>
        <tr>
            <td> 내용 </td>
            <td> <textarea name="content" rows="5" cols="100">${dto.content}</textarea> </td>
        </tr>
        <tr>
            <td> 사진 업로드</td>
            <td> <input type="file" name="file1"><br /></td>
        </tr>
        <tr>
            <td> 사진 업로드</td>
            <td> <input type="file" name="file2"><br /></td>
        </tr>
        <tr>
            <td> 사진 업로드</td>
            <td> <input type="file" name="file3" ><br /></td>
        </tr>
        <tr>
            <td colspan="2"> 
                <input type="hidden" name="b1_number" value="${dto.b1_number}">
                <input type="submit" value="수정">
                &nbsp;&nbsp; <a href="list">목록보기</a>
            </td>
        </tr>
    </form>
</table>
</body>
</html>