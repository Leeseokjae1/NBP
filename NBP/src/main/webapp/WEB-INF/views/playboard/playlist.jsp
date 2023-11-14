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
         <li><a href="/b1page?page=1">니빵이</a></li>
         <li><a href="/b2page?page=1">내빵이</a></li>
         <li><a href="#">랭킹빵</a></li>
         <li><a href="/playpage?page=1">놀이빵</a></li>
         <li><a href="#">로그인</a></li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="#">로그아웃</a></li>
       </ul>
    </nav>


<div class="container mt-5">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">작성자</th>
                <th scope="col">제목</th>
                <th scope="col">좋아요 / 싫어요</th>
                <th scope="col">삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${playlist}" var="play">
                <tr>
                    <th scope="row">${play.f_number}</th>
                    <td>${play.writer}</td>
                    <td><a href="playview?f_number=${play.f_number}&check_b=3">${play.title}</a></td>
                    <td>👍🏻: ${play.b_like} / 👎 : ${play.b_dislike}</td>
                    <td><a href="playdelete?f_number=${play.f_number}">X</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <ul class="pagination justify-content-center">
        <c:if test="${page > 1}">
            <li class="page-item">
                <a class="page-link" href="/playpage?page=1" aria-label="처음">
                    <span aria-hidden="true">처음</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="/playpage?page=${page - 1}" aria-label="이전">
                    <span aria-hidden="true">이전</span>
                </a>
            </li>
        </c:if>

        <c:forEach var="i" begin="1" end="${totalPage}">
            <li class="page-item <c:if test='${i eq page}'>active</c:if>">
                <a class="page-link" href="/playpage?page=${i}">${i}</a>
            </li>
        </c:forEach>

        <c:if test="${page < totalPage}">
            <li class="page-item">
                <a class="page-link" href="/playpage?page=${page + 1}" aria-label="다음">
                    <span aria-hidden="true">다음</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="/playpage?page=${totalPage}" aria-label="마지막">
                    <span aria-hidden="true">마지막</span>
                </a>
            </li>
        </c:if>
    </ul>

    <div style="display: flex; justify-content: flex-end; margin-top: 20px;">
        <a href="playwriteform" class="btn btn-primary">글작성</a>
    </div>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>