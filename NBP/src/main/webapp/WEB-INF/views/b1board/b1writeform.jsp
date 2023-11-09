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
<br><p>

<table width="500" cellpadding="0" cellspacing="0" border="1">
	<form action="b1write" method="post" enctype="multipart/form-data">
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
				&nbsp;&nbsp; <a href="list">목록보기</a></td>
		</tr>
	</form>
</table>

</body>
</html>