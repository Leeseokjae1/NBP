<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.study.nbnb.dto.BuserDto" %>
<%@ page import="com.study.nbnb.dto.PlayDto" %>
<%
PlayDto view = (PlayDto)session.getAttribute("playdto");
int f_number = view.getF_number();
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
      
   .like-button {
        border: none; 
        background-color: transparent; 
        cursor: pointer;
    }


    .like-button img {
        width: 70px;
        height: 70px;
    }
    .mb-3 {
        margin-bottom: 1rem !important;
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
         <li><a href="/member/b1page?page=1">니빵이</a></li>
         <li><a href="/member/b2page?page=1">내빵이</a></li>
         <li><a href="/rpage">랭킹빵</a></li>
         <li><a href="/member/playpage?page=1">놀이빵</a></li>
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

<div class="container mt-5">
    <h4>내용보기</h4>
    <hr>
    
    <div class="mb-3 text-left"> 
		    <strong style="font-size: 1.5em;">작성자&nbsp;: ${playview.writer}&nbsp;님  </strong>
		</div>
		<hr style="border: 1px solid;">
		<div class="mb-3 text-left">
		    <strong style="font-size: 1.5em;">제목&nbsp;: ${playview.title} </strong>
		</div>
		<div class="container mt-5">
		    <div class="row justify-content-center" style="border: 2px solid;">
		        <div class="col-md-12 mb-3 text-left">
		            <div class="mb-3">
		            <br/>
		                <strong style="font-size: 1.5em;">내용&nbsp;: ${playview.content} </strong>
		            </div>
		
		            <div class="row justify-content-center">
		                <div class="col-md-4 mb-3 text-center">
		                    <img src="${playview.imageurl}" style="width:80%; max-height:300px; height:auto;">
		                </div>

		            </div>
		        </div>
		    </div>
		</div>
    
        <div class="mb-3">
                <strong>좋아요:</strong> <span class="like-count">${playview.b_like}</span> &nbsp;&nbsp;
			    <strong>싫어요:</strong> <span class="dislike-count">${playview.b_dislike}</span>
        </div>
		<%
		
		if(session.getAttribute("login") != null){ %>
        <div class="mb-3">
		    <button class="like-button" data-value="1">
		        <img src="/images/like.png" style="width:70px; height:70px;"/>
		    </button>
		
		    <button class="like-button" data-value="-1">
		        <img src="/images/dislike.png" style="width:70px; height:70px;">
		    </button>
		</div>
      <%}else{ %>
                <div class="mb-3">
                <img src="/images/like.png" style="width:70px; height:70px;">

                <img src="/images/dislike.png" style="width:70px; height:70px;">
        </div>
        
        <%} %>
   		<%if(m_number == mn){ %>
		<div class="mb-3 text-right">
		    <a href="playmodifyview?f_number=${playview.f_number}" class="btn btn-outline-info ml-auto">수정하기</a>
		    <a href="playpage?page=1" class="btn btn-outline-info ml-2">목록보기</a>
		    <a href="playdelete?f_number=${playview.f_number}" class="btn btn-danger ml-2"
		    onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
		</div>
		<%}else{ %>
		<div class="mb-3 text-right">
		    <a href="playpage?page=1" class="btn btn-outline-info ml-2">목록보기</a>
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
                <td><a href="replydelete?c_number=${comment.c_number}&t_number=${comment.t_number}" class="btn btn-outline-danger">X</a></td>
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
        <button type="submit" class="btn btn-outline-info">댓글 작성</button>
       
    </form>


</div>

<script>
    var likeCount = ${playview.b_like};
    var dislikeCount = ${playview.b_dislike};

    $(document).ready(function () {
        
        $(".like-button").click(function () {
            var check_b = 3;
            var t_number = <%= f_number %>;
            var m_number = <%= m_number %>;
            var l_or_dl = $(this).data("value");

            $.ajax({
                type: "GET",
                url: "/member/playlike",
                data: {
                    check_b: check_b,
                    t_number: t_number,
                    m_number: m_number,
                    l_or_dl: l_or_dl
                },
                success: function (data) {
                    console.log(data);
                    var likeCount = data.p_like;
                    var dislikeCount = data.p_dislike;

                    $(".like-count").text(likeCount);
                    $(".dislike-count").text(dislikeCount);
                },
                error: function () {
                    alert("에러가 발생했습니다.");
                }
            });
        });
    });
</script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>