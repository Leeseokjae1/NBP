<%@page import="com.study.nbnb.dto.BuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
   BuserDto a = (BuserDto)session.getAttribute("login");
   int m_number = a.getM_NUMBER();
%>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
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
   .empty-space {
    margin-top: 10px;
    background-color: #FFC1B5;
    height: 30px;
    margin-left: 200px; 
    margin-right: 200px;
   }

   .admintabs {
       top: 120px;
       left: 200px;
       width: 200px;
       display: flex;
       flex-direction: column;
       background-color: #e3dde1; 
       margin-left: 200px;
       height: 100vh; 
       
   }
   
   .admintab {
       text-decoration: none;
       color: #000;
       font-size: 15px;
       padding: 10px;
       border-bottom: 1px solid #ccc;
       transition: background-color 0.3s;
   }
   
   .admintabs:hover {
       background-color: #eee;
   }
   .content {
        margin-left: 200px;
        padding: 20px;
    }

    .tabname {
        text-decoration: none;
        color: #000;
        font-size: 15px;
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }

    .subtab:hover {
        background-color: #eee;
    }
    .content {
        position: absolute;
        top: 150px;
        left: 20%;
        margin-left: 120px;
        padding: 20px;
        width: 1130px;
    }
   @media (max-width: 1300px) {
       .empty-space {
           display: none;
       }
       .admintabs {
           top: 70px;
           left: 0;
           width: 100%;
           height: 45px;
           overflow: auto;
           flex-direction: row;
           justify-content: space-around;
           margin-left: 0;
           position: static; 
           z-index: 1;
           flex-wrap: wrap; 
       }
   
       .admintab {
          width: calc(20% - 20px);
          height: 45px;
           border-bottom: 1px solid #ccc;
           padding: 10px 0;
           box-sizing: border-box;
           text-align: center;
       }
   
       .content {
           position: relative;
           top: 0;
           left: 0;
           margin-left: 0;
           margin-top: 45px;
           padding: 20px;
           width: 100%;
       }
   }
   nav[aria-label="Page navigation"] {
    width: 1160px;
    margin: 10px 0;
   }
   .pagination {
       display: flex;
       justify-content: center;
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
   <div class="empty-space"></div>
   <div class="admintabs">
       <a href="/admin/member?page=1" class="tabname">회원관리</a>
       <a href="/admin/adminbd" class="admintab">게시글관리</a>
       <a href="/admin/adminshop" class="admintab">결제관리</a>
       <a href="#" class="tabname">문의접수</a>
       <a href="#" class="admintab">문의조회</a>
   </div>
     <div class="content">
     
        <form id="search_form" name="search_form" action="member" method="post">
           <select id="Searchfield" name="Searchfield" class="form-select">
               <option id="SID" value="ID">ID</option>
               <option id="SEMAIL" value="EMAIL">Email</option>
           </select>
           <input type="text" id="Search" name="Search" placeholder="검색">
           <input type="submit" class="btn btn-primary" value="검색">
        </form>
     
       <table border="1">
           <tr>
               <th>no</th>
              <th>NAME</th>
              <th>ID</th>
              <th>ADDR</th>
              <th>EMAIL</th>
              <th>PH</th>
              <th>NN</th>
              <th>TC</th>
              <th>BB</th>
              <th>S_C</th>
              <th>S_D</th>
           </tr>
           <c:forEach items="${userList}" var="list">
                <tr>
                <td><a href="../admin/member_profile?m_number=${list.m_NUMBER}">${list.m_NUMBER}</a></td>
                 <td>${list.NAME}</td>
                 <td>${list.ID}</td>
                 <td>${list.ADDRESS}</td>
                 <td>${list.EMAIL}</td>
                 <td>${list.PHONENUMBER}</td>
                 <td>${list.NICKNAME}</td>
                 <td>${list.TICKET}</td>
                 <td>${list.BBANG}</td>
                 <td>${list.s_COMMENT}</td>
                 <td>${list.s_DATE}</td>
            </tr>
          </c:forEach>
          
      </table>
      
      <table>
         <tr>
           <ul class="pagination justify-content-center">
              <c:if test="${page > 1}">
                  <li class="page-item">
                      <a class="page-link" href="/admin/member?page=1&Searchfield=${field}&Search=${search}" aria-label="처음">
                          <span aria-hidden="true">처음</span>
                      </a>
                  </li>
                  <li class="page-item">
                      <a class="page-link" href="/admin/member?page=${page - 1}&Searchfield=${field}&Search=${search}" aria-label="이전">
                          <span aria-hidden="true">이전</span>
                      </a>
                  </li>
              </c:if>
      
              <c:forEach var="i" begin="1" end="${totalPage}">
                  <li class="page-item <c:if test='${i eq page}'>active</c:if>">
                      <a class="page-link" href="/admin/member?page=${i}&Searchfield=${field}&Search=${search}">${i}</a>
                  </li>
              </c:forEach>
      
              <c:if test="${page < totalPage}">
                  <li class="page-item">
                      <a class="page-link" href="/admin/member?page=${page + 1}&Searchfield=${field}&Search=${search}" aria-label="다음">
                          <span aria-hidden="true">다음</span>
                      </a>
                  </li>
                  <li class="page-item">
                      <a class="page-link" href="/admin/member?page=${totalPage}&Searchfield=${field}&Search=${search}" aria-label="마지막">
                          <span aria-hidden="true">마지막</span>
                      </a>
                  </li>
              </c:if>
          </ul>
          </tr>
      </table>
    </div>
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
</body>
</html>