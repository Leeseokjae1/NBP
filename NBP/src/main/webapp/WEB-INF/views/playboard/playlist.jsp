<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.study.nbnb.dto.BuserDto" %>
<%
int m_number = 0;
String writer = "";
if(session.getAttribute("login") != null){
BuserDto member = (BuserDto)session.getAttribute("login");
m_number = member.getM_NUMBER();
writer = member.getNICKNAME();
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
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>놀이빵 게시판</title>
<style>
      #nav2 > a,
	#nav2 > ul > li,
	#nav2 > ul > li > a {
	  color: #000; 
	  font-size: 18px; 
	  font-weight: bold;
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
      .menu-toggle {
       position: absolute;
       right: 0;
       top: 0;
       cursor: pointer;
     }
      @media screen and (max-width: 1400px) {
  #nav2 img {
    position: absolute;
    left: 0;
    top: 0; 
  }
  #nav2 ul {
    flex-direction: column;
    display: none;
    position: absolute;
    top: 90px;
    left: 0; 
    width: 100%;  
    background: linear-gradient(to right, #ffffff, #e3dde1);
    border-radius: 0 0 10px 10px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
  }
  #nav2 ul::before { 
    content: "";
    position: absolute;
    top: 0px;
    left: 30px;
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    border-bottom: 10px solid #ffffff;
  }
  #nav2 ul li a {
    color: #000000;
  }
  #nav2 ul li ul {
    display: none;
  }
  #topbox {
    flex-direction: column;
    align-items: center;
  }
  #iconbox {
    flex-direction: column;
    align-items: center;
  }
  .icons {
    margin-bottom: 20px;
  }
}
      
      
   </style>  
</head>
<body>
   <nav id="nav2">
   <a href="/main">
      <img src= "/img/nblogo.png" style="width:190px; height:80px;float: left; margin-right: 10px;"></a>
<!-- <a href="#" style="float: right; margin-top: 10px;margin-right: 10px;">로그인</a> --> 
<div class="menu-toggle">☰</div>            
<ul>
		<%if(session.getAttribute("login") == null) {%>
         <li><a href="/member/b1page?page=1&Searchdata=&Searchfield=">니빵이</a></li>
         <li><a href="/member/b2page?page=1&Searchdata=&Searchfield=">내빵이</a></li>
         <li><a href="/rpage">랭킹빵</a></li>
         <li><a href="/member/playpage?page=1&Searchdata=&Searchfield=">놀이빵</a></li>
         <li><a href="/loginView">로그인</a></li>
         <%}else { %>
         <li>${login.NICKNAME} 님</li>
         <li><a href="/member/b1page?page=1&Searchdata=&Searchfield=">니빵이</a></li>
         <li><a href="/member/b2page?page=1&Searchdata=&Searchfield=">내빵이</a></li>
         <li><a href="/rpage">랭킹빵</a></li>
         <li><a href="/member/playpage?page=1&Searchdata=&Searchfield=">놀이빵</a></li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="/logout">로그아웃</a></li>
         <%} %>
         <% if (session.getAttribute("admin") != null) { %> 
         <li><a href="/admin/adminbd">관리빵 페이지</a></li>
             <%}%>
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
                         <a href="playview?f_number=${play.f_number}&check_b=3" class="post-b" 
                            data-f_number="${play.f_number}" data-checkb="3">${play.title}</a>
                     </td>
                     <td>👍🏻: ${play.b_like} / 👎 : ${play.b_dislike}</td>
			            <td>${play.time}</td>
			        </tr>
			    </c:forEach>
			</tbody>
    </table>

    <ul class="pagination justify-content-center">
        <c:if test="${page > 1}">
            <li class="page-item">
                <a class="page-link" href="playpage?Searchdata=${kw}&Searchfield=${bd}&page=1" aria-label="처음">
                    <span aria-hidden="true">처음</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="playpage?Searchdata=${kw}&Searchfield=${bd}&page=${page - 1}" aria-label="이전">
                    <span aria-hidden="true">이전</span>
                </a>
            </li>
        </c:if>

        <c:forEach var="i" begin="1" end="${totalPage}">
            <li class="page-item <c:if test='${i eq page}'>active</c:if>">
                <a class="page-link" href="playpage?Searchdata=${kw}&Searchfield=${bd}&page=${i}">${i}</a>
            </li>
        </c:forEach>

        <c:if test="${page < totalPage}">
            <li class="page-item">
                <a class="page-link" href="playpage?Searchdata=${kw}&Searchfield=${bd}&page=${page + 1}" aria-label="다음">
                    <span aria-hidden="true">다음</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="playpage?Searchdata=${kw}&Searchfield=${bd}&page=${totalPage}" aria-label="마지막">
                    <span aria-hidden="true">마지막</span>
                </a>
            </li>
        </c:if>
    </ul>

    <div style="display: flex; justify-content: flex-end; margin-top: 20px;">
    <%if(session.getAttribute("login") != null){ %>
        <a href="playwriteform?m_number=<%=m_number%>" class="btn btn-outline-info">글작성</a>
        <%} %>
    </div>
</div>

<script>
$(document).ready(function () {
    $(".post-b").click(function () {
       var f_number = $(this).data("f_number");
         var checkb = $(this).data("checkb");
       $.ajax({
           type: "POST",
           contentType: "application/json",
           url: "/api/playview",
           data: JSON.stringify({ "f_number": f_number, "check_b": checkb }),
           dataType: "json",
           success: function (data) {
               console.log(data);
               //var newWindow = window.open("", "_blank");
               //newWindow.document.write("<html><head><title>Response Body</title></head><body><pre>" + JSON.stringify(data, null, 2) + "</pre></body></html>");
            
           },
           error: function (error) {
              console.error('Error during AJAX request:', error);
           }
       });
   });
});

</script>
<script>
   document.querySelector('.menu-toggle').addEventListener('click', function() {
        var nav = document.querySelector('#nav2 ul');
        if (nav.style.display === 'none') {
          nav.style.display = 'block';
        } else {
          nav.style.display = 'none';
        }
      });

      document.querySelector('#nav2 ul li.board').addEventListener('click', function() {
        var submenu = document.querySelector('#nav2 ul li ul');
        if (submenu.style.display === 'none') {
          submenu.style.display = 'block';
        } else {
          submenu.style.display = 'none';
        }
      });
   </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>