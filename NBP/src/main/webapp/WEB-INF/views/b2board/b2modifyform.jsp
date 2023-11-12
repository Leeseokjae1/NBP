<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	
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
<div>
<table width="500" cellpadding="0" cellspacing="0" border="1">
    <form action="b2modify" method="post" enctype="multipart/form-data">
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
                <input type="hidden" name="b2_number" value="${dto.b2_number}">
                <input type="submit" value="수정">
                &nbsp;&nbsp; <a href = b2view?b2_number=${b2modify.b2_number}&check_b=2">취소</a>
                &nbsp;&nbsp; <a href="b2list">목록보기</a>
            </td>
        </tr>
    </form>
</table>
</div>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
</body>
</html>