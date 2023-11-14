<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

    <style>

        .image {
            text-align: center;
        }

        .image img {
            width: 200px;
            height: 200px;
            margin-bottom: 20px;
        }
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

    <title>게시판</title>
</head>
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
         <% if (session.getAttribute("Admin") != null) { %>
         <li><a href="#">관리빵 페이지</a></li>
         <% } %>
       </ul>
    </nav>
    <h1>내빵이 게시판</h1>
    <div class="container">
        <div class="row">
            <c:forEach items="${list}" var="dto">
                <div class="col-md-3 image">
                    <a href="b2view?b2_number=${dto.b2_number}&check_b=2">
                        <img src="${dto.imageurl1}">
                    </a>
                    <br>
                    ${dto.b2_number} &nbsp;&nbsp; ${dto.writer}<br>
                    ${dto.title} &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="b2delete?b2_number=${dto.b2_number}">X</a>
                </div>
            </c:forEach>
        </div>
    </div>
<ul class="pagination" style="display: flex; list-style-type: none;">
    
    <c:if test="${page > 1}">  
   		<a class="page-link" href="/b2page?page=1">처음</a> &nbsp;
        <a class="page-link" href="/b2page?page=${page - 1}">이전</a>&nbsp;
    </c:if>

    <c:forEach var="i" begin="1" end="${totalPage}">
        <c:choose>
            <c:when test="${i eq page}">	
                <span class="page-link">${i}</span>&nbsp;
            </c:when>
            <c:otherwise>
                <a class="page-link" href="/b2page?page=${i}">${i}</a>&nbsp;
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${page < totalPage}">
        <a class="page-link" href="/b2page?page=${page + 1}">다음</a>&nbsp;
        <a class="page-link" href="/b2page?page=${totalPage}">마지막</a>&nbsp;
    </c:if>
</ul>
    <p><a href="b2writeform">글작성</a></p>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
