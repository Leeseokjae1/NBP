<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
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
<script>

function form_check(){
	
	submit_ajax();
}
function submit_ajax(){
   	document.getElementById("playmodify").submit();
}

</script>

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