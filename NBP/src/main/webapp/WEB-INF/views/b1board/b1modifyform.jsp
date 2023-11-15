<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
   session.removeAttribute("Searchdata");
   session.removeAttribute("Searchfield");   
%>
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
	 width:1520px;overflow:hidden;height:80px;margin:10px 10px 10px 210px;
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
         <li><a href="/b1page?page=1">니빵이</a></li>
         <li><a href="/b2page?page=1">내빵이</a></li>
         <li><a href="/adminbd">랭킹빵</a></li>
         <li><a href="/playpage?page=1">놀이빵</a></li>
         <%if(session.getAttribute("login") == null) {%>
         <li><a href="/loginView">로그인</a></li>
         <%}else { %>
         <li>${login.NICKNAME} 님</li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="/logout">로그아웃</a></li>
         <%} %>
         <% if (session.getAttribute("Admin") != null) { %>
         <li><a href="#">관리빵 페이지</a></li>
         <% } %>
       </ul>
    </nav>
<br>
    <div class="container mt-5">
        <form action="b1modify" method="post" enctype="multipart/form-data">
            <table class="table table-bordered">
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="writer" class="form-control" value="${dto.writer}"></td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" class="form-control" value="${dto.title}"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea name="content" rows="5" cols="100" class="form-control">${dto.content}</textarea></td>
                </tr>
                <tr>
                    <td>사진 업로드</td>
                    <td><input type="file" name="file1" class="form-control-file"><br></td> 
                </tr>
                <tr>
                    <td>사진 업로드</td>
                    <td><input type="file" name="file2" class="form-control-file"><br></td> 
                </tr>
                <tr>
                    <td>사진 업로드</td>
                    <td><input type="file" name="file3" class="form-control-file"><br></td> 
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="hidden" name="b1_number" value="${dto.b1_number}">
                        <input type="submit" value="수정" class="btn btn-primary">
                        <a href="list" class="btn btn-primary">목록보기</a>
                        <a href="b1view?b1_number=${b1modify.b1_number}&check_b=1" class="btn btn-secondary">취소</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
</body>
</html>