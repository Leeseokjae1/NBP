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
 <title>내빵이 게시판</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
     #nav2 > a,
	#nav2 > ul > li,
	#nav2 > ul > li > a {
	  color: #000; 
	  font-size: 18px; 
	  font-weight: bold;
	}
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
    <h1 class="text-center mt-4">내빵이 게시판</h1>
	<a href="/map" class="btn btn-outline-info mx-auto d-block mb-4">지도 보기</a>
	
	<div class="container">
        <div class="row">
            <c:forEach items="${list}" var="dto">
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img src="${dto.imageurl1}" class="card-img-top" alt="Card Image" style="width: 100%; height: 200px; object-fit: contain;">
                        <div class="card-body">
                            <h5 class="card-title">${dto.title}</h5>
                            <p class="card-text">${dto.b2_number} ${dto.writer}</p>
                            <p class="card-text">👍🏻: ${dto.b_like} 👎: ${dto.b_dislike}</p>
                            <a href="/member/b2view?b2_number=${dto.b2_number}&check_b=2" class="btn btn-outline-info post-b" 
                            data-b2number="${dto.b2_number}" data-checkb="2">자세히 보기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
   <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${page > 1}">
                <li class="page-item"><a class="page-link" href="b2page?Searchdata=${kw}&Searchfield=${bd}&page=1">처음</a></li>
                <li class="page-item"><a class="page-link" href="b2page?Searchdata=${kw}&Searchfield=${bd}&page=${page - 1}">이전</a></li>
            </c:if>
            <c:forEach var="i" begin="1" end="${totalPage}">
                <li class="page-item <c:if test='${i eq page}'>active</c:if>">
                    <a class="page-link" href="b2page?Searchdata=${kw}&Searchfield=${bd}&page=${i}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${page < totalPage}">
                <li class="page-item"><a class="page-link" href="b2page?Searchdata=${kw}&Searchfield=${bd}&page=${page + 1}">다음</a></li>
                <li class="page-item"><a class="page-link" href="b2page?Searchdata=${kw}&Searchfield=${bd}&page=${totalPage}">마지막</a></li>
            </c:if>
        </ul>
        <%if(session.getAttribute("login") != null){ %>
        <p class="text-right mt-2"><a href="b2writeform?m_number=<%=m_number%>" class="btn btn-outline-info">글작성</a></p>
        <%} %>
    </nav>

<script>
    $(document).ready(function () {
    	 $(".post-b").click(function () {
    		 var b2Number = $(this).data("b2number");
             var checkB = $(this).data("checkb");
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/api/b2view",
            data: JSON.stringify({ "b2_number": b2Number, "check_b": checkB }),
            dataType: "json",
            success: function (data) {
                console.log(data);
                //var newWindow = window.open("", "_blank");
                //newWindow.document.write("<html><head><title>Response Body</title></head><body><pre>" + JSON.stringify(data, null, 2) + "</pre></body></html>");
             
            },
            error: function (err) {
                alert("에러가 발생했습니다." + err);
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
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
