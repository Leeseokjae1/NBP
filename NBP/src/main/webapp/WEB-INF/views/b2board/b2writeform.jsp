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
	<form action="b2write" method="post" enctype="multipart/form-data">
		<tr>
			<td> 작성자 </td>
			<td> <input type="text" name="writer" size="100"> </td>
		</tr>
		<tr>
			<td> 제목 </td>
			<td> <input type="text" name="title" size="100"> </td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td> <input type="text" name="content" size="100"> </td>
		</tr>
	    <tr>
	        <td> 이미지 업로드 1 </td>
	        <td> <input type="file" name="file1"> </td>
	    </tr>
	    <tr>
	        <td> 이미지 업로드 2 </td>
	        <td> <input type="file" name="file2"> </td>
	    </tr>
	    <tr>
	        <td> 이미지 업로드 3 </td>
	        <td> <input type="file" name="file3"> </td>
	    </tr>
		<tr>
			<td colspan="2"> <input type="submit" value="입력">
				&nbsp;&nbsp; <a href="b2list">목록보기</a></td>
		</tr>
	</form>
</table>

</body>
</html>