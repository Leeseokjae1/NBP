<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.study.nbnb.dto.BuserDto" %>
<%@ page import="com.study.nbnb.dto.B2Dto" %>
<%
B2Dto view = (B2Dto)session.getAttribute("b2dto");
int mn = view.getM_number();
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
         <li><a href="/rpage">랭킹빵</a></li>
         <li><a href="/playpage?page=1">놀이빵</a></li>
         <%if(session.getAttribute("login") == null) {%>
         <li><a href="/loginView">로그인</a></li>
         <%}else { %>
         <li>${login.NICKNAME} 님</li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="/logout">로그아웃</a></li>
         <%} %>
        <!-- if (session.getAttribute("Admin") != null) { %> --> 
         <li><a href="/adminbd">관리빵 페이지</a></li>
        <!-- <li><a href="/logout">로그아웃</a></li>
         } %>-->
       </ul>
    </nav>

   <div class="container mt-5">
        <h1 class="mb-4 text-center">내용보기</h1>
        <hr style="border: 1px solid;">

        <div class="mb-3 text-left"> 
		    <strong style="font-size: 1.5em;">작성자&nbsp;:  ${dto.writer}&nbsp;님  </strong>
		</div>
		<hr style="border: 1px solid;">
		<div class="mb-3 text-left">
		    <strong style="font-size: 1.5em;">제목&nbsp;: ${dto.title} </strong>
		</div>
		<div class="container mt-5">
		    <div class="row justify-content-center" style="border: 2px solid;">
		        <div class="col-md-12 mb-3 text-left">
		            <div class="mb-3">
		                <strong style="font-size: 1.5em;">내용&nbsp;: ${dto.content} </strong>
		            </div>
		
		            <div class="row justify-content-center">
		                <div class="col-md-4 mb-3 text-center">
		                    <img src="${dto.imageurl1}" style="width:80%; max-height:300px; height:auto;">
		                </div>
		
		                <div class="col-md-4 mb-3 text-center">
		                    <img src="${dto.imageurl2}" style="width:80%; max-height:300px; height:auto;">
		                </div>
		
		                <div class="col-md-4 mb-3 text-center">
		                    <img src="${dto.imageurl3}" style="width:80%; max-height:300px; height:auto;">
		                </div>
		            </div>
		        </div>
		    </div>
		</div>


        <div class="mb-3">
            <strong>좋아요:</strong> ${dto.b_like} &nbsp;&nbsp; <strong>싫어요:</strong> ${dto.b_dislike}
        </div>
		<%if(session.getAttribute("login") != null){ %>
        <div class="mb-3">
            <a href="../b2like?check_b=2&t_number=${dto.b2_number}&m_number=<%=m_number%>&l_or_dl=1">
                <img src="/images/like.png" style="width:70px; height:70px;">
            </a>

            <a href="../b2like?check_b=2&t_number=${dto.b2_number}&m_number=<%=m_number%>&l_or_dl=-1">
                <img src="/images/dislike.png" style="width:70px; height:70px;">
            </a>
        </div>
		<%}else{ %>
                <div class="mb-3">
                <img src="/images/like.png" style="width:70px; height:70px;">

                <img src="/images/dislike.png" style="width:70px; height:70px;">
        </div>
        
        <%} %>
   		<%if(m_number == mn){ %>
		<div class="mb-3 text-right">
		    <a href="b2modifyform?b2_number=${dto.b2_number}" class="btn btn-primary ml-auto">수정하기</a>
		    <a href="b2page?page=1" class="btn btn-primary ml-2">목록보기</a>
		    <a href="b2delete?b2_number=${dto.b2_number}" class="btn btn-danger ml-2">삭제</a>
		</div>
		<%}else{ %>
		<div class="mb-3 text-right">
		    <a href="b1page?page=1" class="btn btn-primary ml-2">목록보기</a>
		</div>
		<%} %>
		<hr>

<table class="table table-bordered">
            <thead>
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${commentview}" var="comment">
                    <tr>
                        <td>${comment.nickname}</td>
                        <td>${comment.cmt}</td>
                        <td><a href="b1replydelete?c_number=${comment.c_number}&t_number=${comment.t_number}" class="btn btn-danger">X</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

		 <form method="post" action="b1replywrite" class="mb-3">
		    <p>
		        <label>댓글 작성자</label>
		        <input type="text" name="nickname" value="${dto.writer}">
		    </p>
		    <p>
		        <textarea rows="5" cols="50" name="cmt"></textarea>
		    </p>
		    <p>
		        <input type="hidden" name="check_b" value="1">
		        <input type="hidden" name="m_number" value="1">
		        <input type="hidden" name="t_number" value="${dto.b2_number}">
		        <button type="submit" class="btn btn-primary">댓글 작성</button>
		    </p>
		</form>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
</body>
</html>