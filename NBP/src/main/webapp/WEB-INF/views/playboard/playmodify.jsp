<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
</head>
<script>

function form_check(){
	
	submit_ajax();
}
function submit_ajax(){
   	document.getElementById("playmodify").submit();
}

</script>

<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="playmodify" id="playmodify" method="post" enctype="multipart/form-data">
			<input type="hidden" name="f_number" id="f_number"
				value="${playmodify.f_number}"> <input type="hidden"
				name="writer" id="writer" value="${playmodify.writer}">
			<tr>
				<td>번호</td>
				<td>${playmodify.f_number}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${playmodify.writer}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${playmodify.title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" name="content">${playmodify.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>사진 업로드</td>
				<td><input type="file" name="file"><br /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="수정"
					onclick="form_check()">&nbsp;&nbsp; <a
					href="playview?f_number=${playmodify.f_number}&check_b=3">취소</a>&nbsp;&nbsp;

				</td>
			</tr>
		</form>
	</table>

</body>
</html>