<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.study.nbnb.dto.BuserDto" %>
<%
int m_number = 0;
if(session.getAttribute("login") != null){
BuserDto member = (BuserDto)session.getAttribute("login");
m_number = member.getM_NUMBER();
String writer = member.getNICKNAME();
}
%>
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
         <li><a href="/logout">로그아웃</a></li>
         <% } %>
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
                <th scope="col">작성 날짜</th>
            </tr>
        </thead>
			<tbody>
			    <c:forEach items="${list}" var="play">
			        <tr>
			            <th scope="row">${play.f_number}</th>
			            <td>${play.writer}</td>
			            <td style="max-width: 300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
			                <a href="playview?f_number=${play.f_number}&check_b=3">${play.title}</a>
			            </td>
			            <td>👍🏻: ${play.b_like} / 👎 : ${play.b_dislike}</td>
			            <td>
						    <script>
						        var originalDate = new Date('${play.time}');
						        var formattedDate = originalDate.toLocaleDateString();
						        document.write(formattedDate);
						    </script>
						</td>
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
    <%if(session.getAttribute("login") != null){ %>
        <a href="playwriteform?m_number=<%=m_number%>" class="btn btn-primary">글작성</a>
        <%} %>
    </div>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>