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
      width:1720px;overflow:hidden;height:80px;margin:10px 10px 10px 210px;
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
         <% if (session.getAttribute("Admin") != null) { %>
         <li><a href="#">관리빵 페이지</a></li>
         <% } %>
       </ul>
    </nav>


<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>좋아요 / 싫어요</td>
		<td>삭제</td>
	</tr>
	<c:forEach items="${playlist}" var="play">
	<tr>
		<td>${play.f_number}</td>
		<td>${play.writer}</td>
		
		<td><a href="playview?f_number=${play.f_number}&check_b=3">${play.title}</a></td>
		<td>👍🏻: ${play.b_like} / 👎 : ${play.b_dislike}</td>
		<td><a href="playdelete?f_number=${play.f_number}">X</td>
	</tr>
	</c:forEach>
</table>
<ul class="pagination" style="display: flex; list-style-type: none;">
    
    <c:if test="${page > 1}">  
   		<a class="page-link" href="/playpage?page=1">처음</a> &nbsp;
        <a class="page-link" href="/playpage?page=${page - 1}">이전</a>&nbsp;
    </c:if>

    <c:forEach var="i" begin="1" end="${totalPage}">
        <c:choose>
            <c:when test="${i eq page}">	
                <span class="page-link">${i}</span>&nbsp;
            </c:when>
            <c:otherwise>
                <a class="page-link" href="/playpage?page=${i}">${i}</a>&nbsp;
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${page < totalPage}">
        <a class="page-link" href="/playpage?page=${page + 1}">다음</a>&nbsp;
        <a class="page-link" href="/playpage?page=${totalPage}">마지막</a>&nbsp;
    </c:if>
</ul>

<p><a href="playwriteform">글작성</a></p>
</body>
</html>