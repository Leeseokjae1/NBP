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
         <li><a href="/list">니빵이</a></li>
         <li><a href="/b2list">내빵이</a></li>
         <li><a href="#">랭킹빵</a></li>
         <li><a href="/playlist">놀이빵</a></li>
         <li><a href="#">로그인</a></li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="#">로그아웃</a></li>
       </ul>
    </nav>
    <h1 class="text-center mt-4">니빵이 게시판</h1>
    <input type="button" class="btn btn-primary mx-auto d-block mb-4" onclick="" value="지도로 보기">
    
    <div class="container">
        <div class="row">
            <c:forEach items="${list}" var="dto">
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img src="${dto.imageurl1}" class="card-img-top" alt="Card Image" style="width: 100%; height: 200px; object-fit: contain;">
                        <div class="card-body">
                            <h5 class="card-title">${dto.title}</h5>
                            <p class="card-text">${dto.b1_number} ${dto.writer}</p>
                            <p class="card-text">따: ${dto.b_like} 언따: ${dto.b_dislike}</p>
                            <a href="/b1view?b1_number=${dto.b1_number}&check_b=1" class="btn btn-primary">자세히 보기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${page > 1}">
                <li class="page-item"><a class="page-link" href="/b1page?page=1">처음</a></li>
                <li class="page-item"><a class="page-link" href="/b1page?page=${page - 1}">이전</a></li>
            </c:if>
            <c:forEach var="i" begin="1" end="${totalPage}">
                <li class="page-item <c:if test='${i eq page}'>active</c:if>">
                    <a class="page-link" href="/b1page?page=${i}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${page < totalPage}">
                <li class="page-item"><a class="page-link" href="/b1page?page=${page + 1}">다음</a></li>
                <li class="page-item"><a class="page-link" href="/b1page?page=${totalPage}">마지막</a></li>
            </c:if>
        </ul>
        <p class="text-right mt-2"><a href="b1writeform" class="btn btn-primary">글작성</a></p>
    </nav>

    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>