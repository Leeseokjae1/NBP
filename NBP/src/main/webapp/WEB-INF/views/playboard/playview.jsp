<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
    <h4>내용보기</h4>
    <hr>
    <div>
        <p><strong>제목 :</strong> ${playview.title}</p>
        <p><strong>작성자 :</strong> ${playview.writer} &nbsp; &nbsp;
            <a href="../playlike?check_b=3&t_number=${playview.f_number}&m_number=1&l_or_dl=1">👍:${playview.b_like}</a> &nbsp;
            <a href="../playlike?check_b=3&t_number=${playview.f_number}&m_number=1&l_or_dl=-1">👎:${playview.b_dislike}</a></p>
        <p><strong>내용 :</strong> ${playview.content}</p>
        <p><strong>사진 :</strong> <img src="${playview.imageurl}" style="width:100px; height:100px;"></p>
    </div>
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
                <td><a href="replydelete?c_number=${comment.c_number}&t_number=${comment.t_number}">X</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <form method="post" action="replywrite">
        <div class="form-group">
            <label for="nickname">댓글 작성자</label>
            <input type="text" class="form-control" id="nickname" name="nickname">
        </div>
        <div class="form-group">
            <label for="cmt">댓글 내용</label>
            <textarea class="form-control" id="cmt" rows="5" name="cmt"></textarea>
        </div>
        <input type="hidden" name="check_b" value=3>
        <input type="hidden" name="m_number" value=1>
        <input type="hidden" name="t_number" value="${playview.f_number}">
        <button type="submit" class="btn btn-primary">댓글 작성</button>
        
	    <a href="playlist" class="btn btn-secondary">목록보기</a>
	    <a href="playmodifyview?f_number=${playview.f_number}" class="btn btn-secondary">수정</a>
	    <a href="playdelete?f_number=${playview.f_number}" class="btn btn-danger">삭제</a>
    </form>


</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>