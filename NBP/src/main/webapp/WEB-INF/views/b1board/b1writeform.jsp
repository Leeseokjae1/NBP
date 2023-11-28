<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
      body {
           background-color: #f8f9fa;
       }
</style>
</head>
<body>
   <nav id="nav2">
      <img src= "/img/nblogo.png" style="width:190px; height:80px;float: left; margin-right: 10px;">
<!-- <a href="#" style="float: right; margin-top: 10px;margin-right: 10px;">로그인</a> -->       
<ul>
         <li><a href="/main">HOME</a></li>
         <li><a href="/member/b1page?page=1&Searchdata=&Searchfield=">니빵이</a></li>
         <li><a href="/member/b2page?page=1&Searchdata=&Searchfield=">내빵이</a></li>
         <li><a href="/rpage">랭킹빵</a></li>
         <li><a href="/member/playpage?page=1&Searchdata=&Searchfield=">놀이빵</a></li>
         <%if(session.getAttribute("login") == null) {%>
         <li><a href="/loginView">로그인</a></li>
         <%}else { %>
         <li>${login.NICKNAME} 님</li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="/logout">로그아웃</a></li>
         <%} %>
         <% if (session.getAttribute("admin") != null) { %> 
         <li><a href="/admin/adminbd">관리빵 페이지</a></li>
             <%}%>
       </ul>
      
   </nav>
 <br>
    <div class="container mt-5">
        <form id="b1Form" action="b1write" method="post" enctype="multipart/form-data">
            <table class="table table-bordered"> 
                <tr>
                    <td>작성자</td>
                    <td>${member.NICKNAME}</td>
                    <input type="hidden" name="writer" value="${member.NICKNAME}">
         			<input type="hidden" name="m_number" value="${member.m_NUMBER}">
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" class="form-control" size="100"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td colspan="4">
                   		<textarea name="content" class="form-control" rows="5" cols="100"></textarea> 
                </tr>
                <tr>
                    <td>이미지(썸네일) 1</td>
                    <td><input type="file" name="file1" class="form-control-file"></td>
                </tr>
                <tr>
                    <td>이미지 업로드 2</td>
                    <td><input type="file" name="file2" class="form-control-file"></td>
                </tr>
                <tr>
                    <td>이미지 업로드 3</td>
                    <td><input type="file" name="file3" class="form-control-file"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="입력" class="btn btn-outline-info upload">
                        <a href="/member/b1page?page=1&Searchdata=&Searchfield=" class="btn btn-secondary">목록보기</a> 
                    </td>
                </tr>
            </table>
        </form>
    </div>
<script>
//$(document).ready(function () {
//    $("#b1Form").submit(function (event) {
//        event.preventDefault();
//
//        var formData = {
//            writer: $("input[name='writer']").val(),
//            m_number: $("input[name='m_number']").val(),
//            title: $("input[name='title']").val(),
//            content: $("textarea[name='content']").val(),
//        };
//
//        $.ajax({
//            type: "POST",
//            contentType: "application/json",
//            url: "/api/b1write",
//            data: JSON.stringify(formData),
//            dataType: "json",
//            success: function (data) {
//               
//                console.log(data);
//            },
//           error: function (err) {
//                
//                alert("에러가 발생했습니다." + err);
//            }
//        });
//    });
//});
</script>
    
        <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
</body>
</html>